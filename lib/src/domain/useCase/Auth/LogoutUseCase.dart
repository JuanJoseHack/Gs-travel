import 'package:GsTravel/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {
  //llamamos al repositorio
  AuthRepository repository;
  //inyectamos al repositorio
  LogoutUseCase(this.repository);

  run() => repository.logout();
}
