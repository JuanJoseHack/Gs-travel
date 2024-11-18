import 'package:equatable/equatable.dart';

class ClientProductDetailState extends Equatable {
  final int quantity;
  final int totalProductsInCart;

  ClientProductDetailState({this.quantity = 0, this.totalProductsInCart = 0});

  ClientProductDetailState copyWith({int? quantity, int? totalProductsInCart}) {
    return ClientProductDetailState(
      quantity: quantity ?? this.quantity,
      totalProductsInCart: totalProductsInCart ?? this.totalProductsInCart,
    );
  }

  @override
  List<Object?> get props => [quantity, totalProductsInCart];
}
