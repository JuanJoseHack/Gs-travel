import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/models/Category.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/bloc/ClienteProductListBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/bloc/ClienteProductListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/bloc/ClienteProductListState.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListState.dart';

class ClientProductPage extends StatelessWidget {
  const ClientProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClienteProductListBloc productBloc =
        BlocProvider.of<ClienteProductListBloc>(context);
    final ClienteCategoryListBloc categoryBloc =
        BlocProvider.of<ClienteCategoryListBloc>(context);

    // Mapa de emojis basado en idCategory
    Map<int, String> categoryEmojis = {
      1: '🍕', // Comida
      2: '✈️', // Viajes
      3: '🧃', // Bebidas
      4: '🍪', // Snacks
    };

    // Cargar productos y categorías solo al iniciar
    productBloc.add(GetAllProducts());
    categoryBloc.add(GetCategories());

    return Scaffold(
      body: BlocBuilder<ClienteCategoryListBloc, ClienteCategoryListState>(
        builder: (context, categoryState) {
          if (categoryState.response is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (categoryState.response is Error) {
            return Center(
              child: Text(
                'Error al cargar categorías: ${(categoryState.response as Error).message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (categoryState.response is Success) {
            List<Category> categories =
                (categoryState.response as Success).data as List<Category>;

            return BlocBuilder<ClienteProductListBloc, ClienteProductListState>(
              builder: (context, productState) {
                if (productState.response is Loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (productState.response is Error) {
                  return Center(
                    child: Text(
                      'Error al cargar productos: ${(productState.response as Error).message}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else if (productState.response is Success) {
                  List<Product> products =
                      (productState.response as Success).data as List<Product>;

                  // Agrupar productos por idCategory
                  Map<int, List<Product>> productsByCategory = {};
                  for (var product in products) {
                    productsByCategory
                        .putIfAbsent(product.idCategory, () => [])
                        .add(product);
                  }

                  return ListView.builder(
                    itemCount: productsByCategory.keys.length,
                    itemBuilder: (context, index) {
                      int categoryId = productsByCategory.keys.elementAt(index);
                      List<Product> categoryProducts =
                          productsByCategory[categoryId]!;

                      // Obtener la categoría
                      Category category = categories.firstWhere(
                        (category) => category.id == categoryId,
                        orElse: () => Category(
                          id: categoryId,
                          name: 'Categoría Desconocida',
                          description: '',
                        ),
                      );

                      // Emoji dinámico
                      String categoryEmoji = categoryEmojis[category.id] ?? '✨';

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${category.name} $categoryEmoji',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 220, // Altura fija para los productos
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryProducts.length,
                              itemBuilder: (context, productIndex) {
                                final product = categoryProducts[productIndex];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      'client/product/detail',
                                      arguments: product,
                                    );
                                  },
                                  child: Container(
                                    width: 150,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: product.image1 != null
                                                ? Image.network(
                                                    product.image1!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    'assets/img/no-image.png',
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          product.name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'S/${product.price.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
