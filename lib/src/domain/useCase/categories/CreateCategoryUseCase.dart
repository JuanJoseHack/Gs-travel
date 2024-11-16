import 'dart:io';

import 'package:GsTravel/src/domain/models/Category.dart';
import 'package:GsTravel/src/domain/repository/CategoriesRepository.dart';

class CreateCategoryUseCase {
  CategoriesRepository categoriesRepository;

  CreateCategoryUseCase(this.categoriesRepository);

  run(Category category, File file) =>
      categoriesRepository.create(category, file);
}
