import 'package:GsTravel/src/domain/useCase/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/GetTotalShoppingBagUseCase.dart';

class ShoppingBagUseCases {
  AddShoppingBagUseCase add;
  GetProductsShoppingBagUseCase getProducts;
  DeleteItemShoppinBagUseCase deleteItem;
  deleteShoppingBagUseCase deleteShoppingBag;
  GetTotalShoppingBagUseCase getTotal;

  ShoppingBagUseCases({
    required this.add,
    required this.getProducts,
    required this.deleteItem,
    required this.deleteShoppingBag,
    required this.getTotal,
  });
}
