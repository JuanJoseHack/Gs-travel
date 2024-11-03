import 'package:ecommerce_v2/src/service/YapeQrPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartProvider.dart';
import 'package:ecommerce_v2/src/domain/models/Product.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi carrito'),
      ),
      body: cartProvider.itemsCount > 0
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      Product product = cartProvider.items[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.network(
                                product.image1 ?? 'assets/img/no-image.png',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'S/ ${product.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            cartProvider
                                                .decreaseQuantity(product);
                                          },
                                        ),
                                        Text('${product.quantity ?? 1}'),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            cartProvider.addItem(product);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  cartProvider.removeItem(product);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Divider(),
                      Text(
                        'Total: S/ ${cartProvider.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          print("Botón de 'Pagar con Yape' presionado.");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => YapeQrPage(
                                amount: cartProvider.totalAmount,
                                phoneNumber: "951705863",
                              ),
                            ),
                          );
                          print("Navegación a YapeQrPage iniciada.");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                        ),
                        child: const Text(
                          'Pagar con Yape',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Text('El carrito está vacío'),
            ),
    );
  }
}
