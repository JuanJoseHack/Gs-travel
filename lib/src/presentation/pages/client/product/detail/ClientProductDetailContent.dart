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
  Product? product;
  ClientProductDetailBloc? bloc;
  ClientProductDetailState state;

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
              // Acción de búsqueda
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
                  style: TextStyle(color: Colors.white),
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
              Spacer(),
              _purchaseButtons(), // Botones de compra y añadir al carrito
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantitySelector() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cantidad:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  bloc?.add(SubtractItem());
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Text(
                state.quantity.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  bloc?.add(AddItem());
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
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
  }

  Widget _purchaseButtons() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: 'Comprando ahora', toastLength: Toast.LENGTH_LONG);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.teal),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Comprar ahora',
                style: TextStyle(color: Colors.teal, fontSize: 16),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: 'Añadido al carrito', toastLength: Toast.LENGTH_LONG);
                bloc?.add(AddProductToShoppingBag(product: product!));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Añadir al carrito',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textDetails() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Margen externo
      padding: EdgeInsets.all(16), // Espaciado interno
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        borderRadius: BorderRadius.circular(20), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Sombra gris suave
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5), // Desplazamiento de la sombra
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product?.name ?? '',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8), // Espaciado entre el título y la descripción
          Text(
            product?.description ?? '',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 12), // Espaciado entre la descripción y el precio
          Row(
            children: [
              Text(
                'S/ ${product?.price ?? ''}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageSlideshow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        borderRadius: BorderRadius.circular(20), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Sombra gris con opacidad
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5), // Desplazamiento de la sombra
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            20), // Bordes redondeados de la imagen también
        child: ImageSlideshow(
          width: double.infinity,
          height: 300,
          initialPage: 0,
          indicatorColor: Colors.purple, // Indicador del slide en color púrpura
          indicatorBackgroundColor: Colors.grey,
          children: [
            product!.image1!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: product!.image1!,
                    fit: BoxFit
                        .cover, // Cambiado a BoxFit.cover para cubrir todo el cuadro
                    fadeInDuration: Duration(seconds: 1),
                  )
                : Container(),
            product!.image2!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: product!.image2!,
                    fit: BoxFit
                        .cover, // Cambiado a BoxFit.cover para cubrir todo el cuadro
                    fadeInDuration: Duration(seconds: 1),
                  )
                : Container(),
          ],
          onPageChanged: (value) {
            print('Page changed: $value');
          },
        ),
      ),
    );
  }
}
