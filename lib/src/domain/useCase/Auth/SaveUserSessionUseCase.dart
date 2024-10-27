import 'package:ecommerce_v2/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_v2/src/domain/repository/AuthRepository.dart';

class SaveUserSessionUseCase {
  AuthRepository authRepository;
  SaveUserSessionUseCase(this.authRepository);

  run(AuthResponse authResponse) =>
      authRepository.saveUserSession(authResponse);
}
