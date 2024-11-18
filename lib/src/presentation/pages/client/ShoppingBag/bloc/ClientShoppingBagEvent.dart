import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

abstract class ClientShoppingBagEvent extends Equatable {
  const ClientShoppingBagEvent();
  @override
  List<Object?> get props => [];
}

//trae los productos añadidos al shared prefed
class GetShoppingBag extends ClientShoppingBagEvent {
  const GetShoppingBag();
}

class AddItems extends ClientShoppingBagEvent {
  final Product product;

  const AddItems({required this.product});

  @override
  List<Object?> get props => [product];
}

class SubtractItems extends ClientShoppingBagEvent {
  final Product product;
  const SubtractItems({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class RemoveItem extends ClientShoppingBagEvent {
  final Product product;
  const RemoveItem({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class GetTotal extends ClientShoppingBagEvent {
  const GetTotal();
}
