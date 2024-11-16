import 'dart:io';

import 'package:GsTravel/src/domain/models/User.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

abstract class UsersRepository {
  Future<Resource<User>> update(int id, User user, File? image);
}
