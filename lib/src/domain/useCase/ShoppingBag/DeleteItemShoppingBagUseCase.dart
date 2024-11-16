import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/repository/ShoppingBagRepository.dart';

class DeleteItemShoppinBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  DeleteItemShoppinBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.deleteItem(product);
}
