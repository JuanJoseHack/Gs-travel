import 'package:GsTravel/src/data/dataSource/remote/service/RolesService.dart';
import 'package:GsTravel/src/domain/models/Roles.dart';
import 'package:GsTravel/src/domain/repository/RolesRepository.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

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
