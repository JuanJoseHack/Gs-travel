import 'package:GsTravel/src/domain/models/OrderList.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

abstract class OrdersRepository {
  // Obtener todas las órdenes de un cliente específico
  Future<Resource<List<OrderList>>> getOrdersByClient(int clientId);
}
