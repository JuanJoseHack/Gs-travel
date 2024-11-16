import 'package:GsTravel/src/domain/models/Roles.dart';
import 'package:GsTravel/src/domain/repository/RolesRepository.dart';

class CreateRolesUseCase {
  RolesRepository rolesRepository;
  CreateRolesUseCase(this.rolesRepository);

  run(Roles roles) => rolesRepository.create(roles);
}
