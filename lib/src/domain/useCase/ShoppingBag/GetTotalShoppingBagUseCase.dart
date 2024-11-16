import 'package:GsTravel/src/domain/repository/ShoppingBagRepository.dart';

class GetTotalShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  GetTotalShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getTotal();
}
