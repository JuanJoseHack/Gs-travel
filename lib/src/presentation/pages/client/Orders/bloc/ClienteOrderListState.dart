import 'package:equatable/equatable.dart';
import 'package:GsTravel/src/domain/models/OrderList.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

class ClienteOrderListState extends Equatable {
  final Resource<List<OrderList>>? orders;
  final bool isLoading;
  final String? errorMessage;

  const ClienteOrderListState({
    this.orders,
    this.isLoading = false,
    this.errorMessage,
  });

  ClienteOrderListState copyWith({
    Resource<List<OrderList>>? orders,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ClienteOrderListState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [orders ?? [], isLoading, errorMessage ?? ''];
}
