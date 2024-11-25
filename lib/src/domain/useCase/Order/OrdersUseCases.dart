import 'package:GsTravel/src/domain/useCase/Order/GetOrdersByClientUseCase.dart';

class OrdersUseCases {
  final GetOrdersByClientUseCase getOrdersByClient;

  // Constructor que inyecta el GetOrdersByClientUseCase
  OrdersUseCases({
    required this.getOrdersByClient,
  });
}
