import 'package:GsTravel/src/domain/models/Category.dart';
import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/ClienteProductListItem.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/bloc/ClienteProductListBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/bloc/ClienteProductListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/bloc/ClienteProductListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:badges/badges.dart' as badges;

class ClientProductListPage extends StatefulWidget {
  const ClientProductListPage({super.key});

  @override
  State<ClientProductListPage> createState() => _ClientProductListPageState();
}

class _ClientProductListPageState extends State<ClientProductListPage> {
  ClienteProductListBloc? _bloc;
  Category? category;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (category != null) {
        // Cargar productos por categoría
        _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
      } else {
        // Cargar todos los productos si no hay categoría
        _bloc?.add(GetAllProducts());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Verificar si hay categoría pasada como argumento
    category = ModalRoute.of(context)?.settings.arguments as Category?;
    _bloc = BlocProvider.of<ClienteProductListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 158, 11),
        centerTitle: true,
        title: const Text(
          'Productos',
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
      body: BlocListener<ClienteProductListBloc, ClienteProductListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              if (category != null) {
                _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
              } else {
                _bloc?.add(GetAllProducts());
              }
            }
          } else if (responseState is Error) {
            Fluttertoast.showToast(
              msg: responseState.message,
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
        child: BlocBuilder<ClienteProductListBloc, ClienteProductListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (responseState is Success) {
              List<Product> products = responseState.data as List<Product>;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Número de columnas en la cuadrícula
                    childAspectRatio:
                        0.75, // Relación de aspecto de cada tarjeta
                    crossAxisSpacing: 10, // Espacio horizontal entre tarjetas
                    mainAxisSpacing: 10, // Espacio vertical entre tarjetas
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ClientProductListItem(_bloc, product);
                  },
                ),
              );
            }
            return const Center(child: Text('No hay productos disponibles'));
          },
        ),
      ),
    );
  }
}
