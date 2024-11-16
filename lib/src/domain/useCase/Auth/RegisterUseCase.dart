import 'package:GsTravel/src/domain/models/User.dart';
import 'package:GsTravel/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository repository;

  //construct of class
  RegisterUseCase(this.repository);

  run(User user) => repository.register(user);
}
