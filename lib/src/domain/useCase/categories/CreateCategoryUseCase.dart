import 'dart:io';

import 'package:ecommerce_v2/src/domain/models/Category.dart';
import 'package:ecommerce_v2/src/domain/repository/CategoriesRepository.dart';

class CreateCategoryUseCase {
  CategoriesRepository categoriesRepository;

  CreateCategoryUseCase(this.categoriesRepository);

  run(Category category, File file) =>
      categoriesRepository.create(category, file);
}