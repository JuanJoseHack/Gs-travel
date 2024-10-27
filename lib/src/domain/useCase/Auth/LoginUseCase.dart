import 'package:ecommerce_v2/src/domain/repository/AuthRepository.dart';

class LoginUseCase {
  //sin inyeccion de dependencias
  // AuthRepository repository = AuthRepositoryImpl();

  // con inyeccion de dependencias
  AuthRepository repository;
  LoginUseCase(this.repository);

  run(String email, String password) => repository.login(email, password);
}
