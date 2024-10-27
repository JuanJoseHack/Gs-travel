import 'package:ecommerce_v2/src/domain/models/User.dart';
import 'package:ecommerce_v2/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository repository;

  //construct of class
  RegisterUseCase(this.repository);

  run(User user) => repository.register(user);
}
