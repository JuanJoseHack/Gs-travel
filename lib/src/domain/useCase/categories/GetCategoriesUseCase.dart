import 'package:ecommerce_v2/src/domain/repository/CategoriesRepository.dart';

class GetCategoriesUseCase {
  CategoriesRepository categoriesRepository;

  GetCategoriesUseCase(this.categoriesRepository);

  run() => categoriesRepository.getCategories();
}
