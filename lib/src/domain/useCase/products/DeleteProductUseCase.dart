import 'package:ecommerce_v2/src/domain/repository/ProductsRepository.dart';

class DeleteProductUseCase {
  ProductsRepository productsRepository;

  DeleteProductUseCase(this.productsRepository);

  run(int id) => productsRepository.delete(id);
}
