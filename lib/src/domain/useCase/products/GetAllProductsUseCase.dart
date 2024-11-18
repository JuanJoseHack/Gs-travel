import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/repository/ProductsRepository.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

class GetAllProductsUseCase {
  final ProductsRepository _repository;

  GetAllProductsUseCase(this._repository);

  Future<Resource<List<Product>>> run() {
    return _repository.getAllProducts();
  }
}
