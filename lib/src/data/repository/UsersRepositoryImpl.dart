import 'dart:io';

import 'package:ecommerce_v2/src/data/dataSource/remote/service/UsersService.dart';
import 'package:ecommerce_v2/src/domain/models/User.dart';
import 'package:ecommerce_v2/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';

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
