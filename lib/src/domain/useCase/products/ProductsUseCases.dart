import 'package:GsTravel/src/domain/useCase/products/CreateProductUseCase.dart';
import 'package:GsTravel/src/domain/useCase/products/DeleteProductUseCase.dart';
import 'package:GsTravel/src/domain/useCase/products/GetAllProductsUseCase.dart';
import 'package:GsTravel/src/domain/useCase/products/GetProductsByCategoryUseCase.dart';
import 'package:GsTravel/src/domain/useCase/products/UpdateProductUseCase.dart';

class ProductsUseCases {
  CreateProductUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;
  UpdateProductUseCase update;
  DeleteProductUseCase delete;
  GetAllProductsUseCase getallproduct;

  ProductsUseCases({
    required this.create,
    required this.getProductsByCategory,
    required this.update,
    required this.delete,
    required this.getallproduct,
  });
}
