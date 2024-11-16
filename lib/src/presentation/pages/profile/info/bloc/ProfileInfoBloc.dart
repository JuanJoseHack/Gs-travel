import 'package:GsTravel/src/domain/models/AuthResponse.dart';
import 'package:GsTravel/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:GsTravel/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:GsTravel/src/presentation/pages/profile/info/bloc/ProfileInfoState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  AuthUseCases authUseCases;

  ProfileInfoBloc(this.authUseCases) : super(ProfileInfoState()) {
    on<ProfileInfoGetUser>(_onGetUser);
  }

  Future<void> _onGetUser(
      ProfileInfoGetUser event, Emitter<ProfileInfoState> emit) async {
    AuthResponse authResponse = await authUseCases.getUserSession.run();
    print(authResponse.user?.image); // Verificar la URL de la imagen
    emit(state.copyWith(user: authResponse.user));
  }
}
