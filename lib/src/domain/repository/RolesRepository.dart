import 'package:GsTravel/src/domain/models/Roles.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

abstract class RolesRepository {
  //Metodos de Roles
  Future<Resource<Roles>> create(Roles rol);
  Future<Resource<List<Roles>>> getRoles();
}
