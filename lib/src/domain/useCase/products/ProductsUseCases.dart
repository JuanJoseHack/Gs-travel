import 'package:ecommerce_v2/src/domain/useCase/products/CreateProductUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/DeleteProductUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/UpdateProductUseCase.dart';

class ProductsUseCases {
  CreateProductUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;
  UpdateProductUseCase update;
  DeleteProductUseCase delete;

  ProductsUseCases({
    required this.create,
    required this.getProductsByCategory,
    required this.update,
    required this.delete,
  });
}
