import 'package:GsTravel/src/domain/models/Product.dart';

class OrderList {
  int id; // ID de la orden
  int idClient; // ID del cliente
  int idAddress; // ID de la dirección
  String status; // Estado de la orden (por defecto "PAGADO")
  DateTime createdAt; // Fecha de creación
  DateTime updatedAt; // Fecha de actualización
  List<Product> products; // Lista de productos asociados a la orden

  OrderList({
    required this.id,
    required this.idClient,
    required this.idAddress,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        id: json["id"],
        idClient: json["id_client"],
        idAddress: json["id_address"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_client": idClient,
        "id_address": idAddress,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
