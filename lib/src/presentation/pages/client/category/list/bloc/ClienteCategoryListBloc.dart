import 'package:GsTravel/src/domain/useCase/categories/CategoriesUseCases.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClienteCategoryListBloc
    extends Bloc<ClienteCategoryListEvent, ClienteCategoryListState> {
  final CategoriesUseCases categoriesUseCases;

  ClienteCategoryListBloc(this.categoriesUseCases)
      : super(ClienteCategoryListState(response: Loading())) {
    on<GetCategories>(_onGetCategories);
  }

  Future<void> _onGetCategories(
      GetCategories event, Emitter<ClienteCategoryListState> emit) async {
    if (state.response is Success && (state.response as Success).data != null) {
      return; // Si ya se cargaron categorías, no volver a cargarlas
    }
    emit(state.copyWith(response: Loading())); // Estado cargando
    try {
      Resource response = await categoriesUseCases.getCategories.run();
      emit(state.copyWith(response: response)); // Estado con la respuesta
    } catch (e) {
      emit(state.copyWith(response: Error("Error al cargar categorías: $e")));
    }
  }
}
