import 'package:GsTravel/src/data/dataSource/remote/service/OrderService.dart'; // Asegúrate de importar el servicio correcto
import 'package:GsTravel/src/domain/models/OrderList.dart'; // Asegúrate de importar el modelo correcto
import 'package:GsTravel/src/domain/repository/OrdersRepository.dart'; // Importa la interfaz de OrdersRepository
import 'package:GsTravel/src/domain/utils/Resource.dart'; // Importa la clase Resource para manejar el resultado

class OrdersRepositoryImpl implements OrdersRepository {
  final OrderService orderService;

  // Constructor que inyecta el servicio
  OrdersRepositoryImpl(this.orderService);

  @override
  Future<Resource<List<OrderList>>> getOrdersByClient(int clientId) {
    // Llamamos al servicio que obtiene las órdenes para el cliente especificado
    return orderService.getOrdersWithProductsByClient(clientId);
  }
}
