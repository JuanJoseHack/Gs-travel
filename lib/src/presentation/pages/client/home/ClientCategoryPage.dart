import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:flutter/material.dart';
import 'package:GsTravel/src/domain/models/Category.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientCategoryPage extends StatelessWidget {
  const ClientCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClienteCategoryListBloc _bloc =
        BlocProvider.of<ClienteCategoryListBloc>(context);

    // Cargar las categorías cuando se muestra la página
    _bloc.add(GetCategories());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Categorías',
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
          IconButton(
            icon: const Icon(Icons.shopping_cart,
                color: Colors.white), // Carrito en blanco
            onPressed: () {
              // Acción del carrito
              Navigator.pushNamed(context, 'client/shopping_bag');
            },
          ),
        ],
      ),
      body: BlocBuilder<ClienteCategoryListBloc, ClienteCategoryListState>(
        builder: (context, state) {
          final response = state.response;
          if (response is Success) {
            List<Category> categories = response.data as List<Category>;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Número de columnas
                  childAspectRatio: 0.9, // Ajusta el aspecto entre ancho y alto
                  crossAxisSpacing: 15, // Espacio horizontal entre celdas
                  mainAxisSpacing: 15, // Espacio vertical entre celdas
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      // Navegar a la lista de productos por categoría
                      Navigator.pushNamed(
                        context,
                        'client/product/list',
                        arguments: category,
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: category.image != null
                                ? Image.network(
                                    category.image!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/img/no-image.png', // Imagen por defecto
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          category.name ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (response is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text(
                'Error al cargar categorías',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }
        },
      ),
    );
  }
}
