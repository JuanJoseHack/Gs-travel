import 'package:GsTravel/src/domain/repository/OrdersRepository.dart';
import 'package:GsTravel/src/domain/models/OrderList.dart'; // Asegúrate de importar el modelo correcto
import 'package:GsTravel/src/domain/utils/Resource.dart'; // Asegúrate de importar Resource para el manejo de resultados

class GetOrdersByClientUseCase {
  final OrdersRepository ordersRepository;

  // Constructor que inyecta el repositorio de órdenes
  GetOrdersByClientUseCase(this.ordersRepository);

  // Ejecuta la lógica de obtener las órdenes por cliente
  Future<Resource<List<OrderList>>> run(int clientId) {
    // Llamamos al repositorio para obtener las órdenes del cliente
    return ordersRepository.getOrdersByClient(clientId);
  }
}
