import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/repository/ShoppingBagRepository.dart';

class AddShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  AddShoppingBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.add(product);
}
