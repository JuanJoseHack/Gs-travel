import 'package:GsTravel/src/domain/models/Product.dart';

class Order {
  int idClient;
  int idAddress;
  List<Product> products;

  Order({
    required this.idClient,
    required this.idAddress,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        idClient: json["id_client"],
        idAddress: json["id_address"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_client": idClient,
        "id_address": idAddress,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
