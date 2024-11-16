import 'dart:io';

import 'package:GsTravel/src/data/dataSource/remote/service/UsersService.dart';
import 'package:GsTravel/src/domain/models/User.dart';
import 'package:GsTravel/src/domain/repository/UsersRepository.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersService usersService;

  UsersRepositoryImpl(this.usersService);

  @override
  Future<Resource<User>> update(int id, User user, File? image) {
    if (image == null) {
      return usersService.update(id, user);
    } else {
      return usersService.updateImage(id, user, image);
    }
  }
}
