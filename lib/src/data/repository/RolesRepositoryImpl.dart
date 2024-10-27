import 'package:ecommerce_v2/src/data/dataSource/remote/service/RolesService.dart';
import 'package:ecommerce_v2/src/domain/models/Roles.dart';
import 'package:ecommerce_v2/src/domain/repository/RolesRepository.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';

class RolesRepositoryImpl implements RolesRepository {
  RolesService rolesService;
  RolesRepositoryImpl(this.rolesService);
  @override
  Future<Resource<Roles>> create(Roles rol) {
    return rolesService.create(rol);
  }

  @override
  Future<Resource<List<Roles>>> getRoles() {
    return rolesService.getRoles();
  }
}
