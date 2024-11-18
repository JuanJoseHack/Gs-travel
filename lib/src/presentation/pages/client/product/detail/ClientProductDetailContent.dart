import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:GsTravel/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:badges/badges.dart' as badges;

class ClientProductDetailContent extends StatelessWidget {
  final Product? product;
  final ClientProductDetailBloc? bloc;
  final ClientProductDetailState state;

  ClientProductDetailContent(this.bloc, this.state, this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Detalle de Producto',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white, // Título en color blanco
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Flecha en blanco
          onPressed: () {
            Navigator.pop(context); // Volver a la página anterior
          },
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.search, color: Colors.white), // Lupa en blanco
            onPressed: () {
              print('Buscar');
            },
          ),
          BlocBuilder<ClientShoppingBagBloc, ClientShoppingBagState>(
            builder: (context, shoppingBagState) {
              // Calcular la cantidad total de productos en el carrito
              int totalProductsInCart = shoppingBagState.products
                  .fold(0, (sum, item) => sum + (item.quantity ?? 0));

              return badges.Badge(
                showBadge:
                    totalProductsInCart > 0, // Mostrar solo si hay productos
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeContent: Text(
                  totalProductsInCart.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.white),
                  onPressed: () {
                    // Acción del carrito
                    Navigator.pushNamed(context, 'client/shopping_bag');
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageSlideshow(),
              _textDetails(), // Llamada al nuevo widget con el cuadro estilizado
              _quantitySelector(), // Nuevo selector de cantidad
              const Spacer(),
              _purchaseButtons(
                  context), // Botones de compra y añadir al carrito
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantitySelector() {
    return BlocBuilder<ClientProductDetailBloc, ClientProductDetailState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cantidad:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      bloc?.add(const SubtractItem());
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '-',
                        style: TextStyle(fontSize: 20, color: Colors.purple),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    state.quantity.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      bloc?.add(const AddItem());
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 20, color: Colors.purple),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _purchaseButtons(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: 'Comprando ahora', toastLength: Toast.LENGTH_LONG);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.teal),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Comprar ahora',
                style: TextStyle(color: Colors.teal, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                bloc?.add(AddProductToShoppingBag(
                    product: product!, context: context));
                Fluttertoast.showToast(
                  msg: 'Añadido al carrito',
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Añadir al carrito',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textDetails() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product?.name ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product?.description ?? '',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'S/ ${product?.price ?? ''}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageSlideshow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ImageSlideshow(
          width: double.infinity,
          height: 300,
          initialPage: 0,
          indicatorColor: Colors.purple,
          indicatorBackgroundColor: Colors.grey,
          children: [
            product!.image1!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: product!.image1!,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(seconds: 1),
                  )
                : Container(),
            product!.image2!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: product!.image2!,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(seconds: 1),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
