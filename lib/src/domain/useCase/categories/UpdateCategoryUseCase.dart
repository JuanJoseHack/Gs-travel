import 'dart:io';

import 'package:GsTravel/src/domain/models/Category.dart';
import 'package:GsTravel/src/domain/repository/CategoriesRepository.dart';

class UpdateCategoryUseCase {
  CategoriesRepository categoriesRepository;

  UpdateCategoryUseCase(this.categoriesRepository);

  run(int id, Category category, File? file) =>
      categoriesRepository.update(id, category, file);
}
