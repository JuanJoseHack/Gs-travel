import 'package:ecommerce_v2/src/domain/repository/CategoriesRepository.dart';

class DeleteCategoryUseCase {
  CategoriesRepository categoriesRepository;

  DeleteCategoryUseCase(this.categoriesRepository);

  run(int id) => categoriesRepository.delete(id);
}
