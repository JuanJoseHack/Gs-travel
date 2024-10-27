import 'package:ecommerce_v2/src/domain/repository/AuthRepository.dart';

class GetUserSessionUseCase {
  AuthRepository authRepository;
  GetUserSessionUseCase(this.authRepository);

  run() => authRepository.getUserSession();
}
