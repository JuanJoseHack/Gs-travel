import 'dart:io';

import 'package:GsTravel/src/domain/models/User.dart';
import 'package:GsTravel/src/domain/repository/UsersRepository.dart';

class UpdateUserUseCase {
  UsersRepository usersRepository;

  UpdateUserUseCase(this.usersRepository);

  run(int id, User user, File? file) => usersRepository.update(id, user, file);
}
