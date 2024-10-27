import 'package:ecommerce_v2/src/domain/useCase/Roles/CreateRolesUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Roles/GetRolesUseCases.dart';

class RolesUseCases {
  CreateRolesUseCase create;
  GetRolesUseCases getRoles;

  RolesUseCases({required this.create, required this.getRoles});
}
