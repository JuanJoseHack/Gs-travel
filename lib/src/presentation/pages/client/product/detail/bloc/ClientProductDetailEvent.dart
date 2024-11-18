import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClientProductDetailEvent extends Equatable {
  const ClientProductDetailEvent();
  @override
  List<Object?> get props => [];
}

class ResetState extends ClientProductDetailEvent {
  const ResetState();
}

class GetProducts extends ClientProductDetailEvent {
  final Product product;
  const GetProducts({required this.product});
  @override
  List<Object?> get props => [product];
}

class AddItem extends ClientProductDetailEvent {
  const AddItem();
  @override
  List<Object?> get props => [];
}

class SubtractItem extends ClientProductDetailEvent {
  const SubtractItem();
  @override
  List<Object?> get props => [];
}

class AddProductToShoppingBag extends ClientProductDetailEvent {
  final Product product;
  final BuildContext context;
  const AddProductToShoppingBag({required this.product, required this.context});
  @override
  List<Object?> get props => [product, context];
}

class ResetQuantityCounter extends ClientProductDetailEvent {
  @override
  List<Object> get props => [];
}
