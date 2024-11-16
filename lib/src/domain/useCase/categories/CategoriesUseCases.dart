import 'package:GsTravel/src/domain/useCase/categories/CreateCategoryUseCase.dart';
import 'package:GsTravel/src/domain/useCase/categories/DeleteCategoryUseCase.dart';
import 'package:GsTravel/src/domain/useCase/categories/GetCategoriesUseCase.dart';
import 'package:GsTravel/src/domain/useCase/categories/UpdateCategoryUseCase.dart';

class CategoriesUseCases {
  CreateCategoryUseCase create;
  GetCategoriesUseCase getCategories;
  UpdateCategoryUseCase update;
  DeleteCategoryUseCase delete;

  CategoriesUseCases(
      {required this.create,
      required this.getCategories,
      required this.update,
      required this.delete});
}
