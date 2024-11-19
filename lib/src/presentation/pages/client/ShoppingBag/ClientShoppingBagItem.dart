import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:flutter/material.dart';

class ClientShoppingBagItem extends StatelessWidget {
  final ClientShoppingBagBloc? bloc;
  final ClientShoppingBagState state;
  final Product? product;

  ClientShoppingBagItem(this.bloc, this.state, this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              _imageProduct(),
              const SizedBox(height: 8),
              _actionsAddAndSubtract(),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textProduct(),
                const SizedBox(height: 4),
                _textDescription(),
                _textPriceOriginal(),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _iconRemove(),
        ],
      ),
    );
  }

  Widget _imageProduct() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: product != null && product!.image1!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/img/no-image.png',
                image: product!.image1!,
                fit: BoxFit.cover,
              ),
            )
          : const Icon(Icons.broken_image, size: 40, color: Colors.grey),
    );
  }

  Widget _textProduct() {
    return Text(
      product?.name ?? 'Producto',
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _textDescription() {
    return Text(
      product?.description ?? 'Descripción no disponible',
      style: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _textPriceOriginal() {
    return Text(
      'S/ ${product?.price?.toStringAsFixed(2) ?? '0.00'}',
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }

  Widget _actionsAddAndSubtract() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            bloc?.add(SubtractItems(product: product!));
          },
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: const Text(
              '-',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
        ),
        Container(
          width: 40,
          height: 35,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Text(
            product?.quantity.toString() ?? '0',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            bloc?.add(AddItems(product: product!));
          },
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Text(
              '+',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconRemove() {
    return IconButton(
      onPressed: () {
        bloc?.add(RemoveItem(product: product!));
      },
      icon: const Icon(Icons.delete, color: Colors.red),
    );
  }
}
