import 'package:equatable/equatable.dart';

abstract class ClienteOrderListEvent extends Equatable {
  const ClienteOrderListEvent();

  @override
  List<Object?> get props => [];
}

class LoadClienteOrders extends ClienteOrderListEvent {
  final int clientId;

  const LoadClienteOrders({required this.clientId});

  @override
  List<Object?> get props => [clientId];
}
