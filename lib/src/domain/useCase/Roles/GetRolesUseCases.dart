import 'package:GsTravel/src/domain/repository/RolesRepository.dart';

class GetRolesUseCases {
  RolesRepository rolesRepository;
  GetRolesUseCases(this.rolesRepository);

  run() => rolesRepository.getRoles();
}
