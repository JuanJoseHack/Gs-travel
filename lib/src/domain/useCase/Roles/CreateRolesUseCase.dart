import 'package:ecommerce_v2/src/domain/models/Roles.dart';
import 'package:ecommerce_v2/src/domain/repository/RolesRepository.dart';

class CreateRolesUseCase {
  RolesRepository rolesRepository;
  CreateRolesUseCase(this.rolesRepository);

  run(Roles roles) => rolesRepository.create(roles);
}
