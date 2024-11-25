import 'dart:convert';
import 'package:GsTravel/src/data/api/ApiConfig.dart';
import 'package:GsTravel/src/domain/models/OrderList.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;

class OrderService {
  Future<String> token;

  OrderService(this.token);

  // Obtener todas las órdenes de un cliente con productos
  Future<Resource<List<OrderList>>> getOrdersWithProductsByClient(
      int clientId) async {
    try {
      Uri url =
          Uri.https(ApiConfig.API_ECOMMECE, '/orders/with-products/$clientId');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
      };
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Mapeamos los datos recibidos a una lista de órdenes
        List<OrderList> orders = List<OrderList>.from(
            data.map((order) => OrderList.fromJson(order)));
        return Success(orders);
      } else {
        // En caso de error en la respuesta, se retorna el mensaje de error
        return Error(data['message']);
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
