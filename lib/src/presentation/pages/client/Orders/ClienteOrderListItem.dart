import 'package:GsTravel/src/domain/models/OrderList.dart';
import 'package:flutter/material.dart';

class ClienteOrderListItem extends StatelessWidget {
  final OrderList order;

  const ClienteOrderListItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aquí puedes definir el comportamiento al hacer tap en un pedido.
        Navigator.pushNamed(context, 'client/order/detail', arguments: order);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Aquí puedes personalizar el diseño del pedido, como la imagen o detalles.
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  'Order #${order.id}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  'Status: ${order.status}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
