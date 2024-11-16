import 'package:GsTravel/src/domain/repository/ShoppingBagRepository.dart';

class deleteShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  deleteShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.deleteShoppingBag();
}
