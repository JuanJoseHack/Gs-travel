import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_v2/src/domain/models/Category.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListState.dart';
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
      body: BlocBuilder<ClienteCategoryListBloc, ClienteCategoryListState>(
        builder: (context, state) {
          final response = state.response;
          if (response is Success) {
            List<Category> categories = response.data as List<Category>;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Número de columnas en la cuadrícula
                  childAspectRatio: 0.8, // Relación de aspecto de cada tarjeta
                  crossAxisSpacing: 10, // Espacio horizontal entre tarjetas
                  mainAxisSpacing: 10, // Espacio vertical entre tarjetas
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      // Acciones al hacer clic en una categoría
                      Navigator.pushNamed(
                        context,
                        'client/product/list',
                        arguments: category,
                      );
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: category.image != null
                                ? Image.network(
                                    category.image!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/img/no-image.png'), // Imagen por defecto
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category.name ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
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
            return const Center(child: Text('Error al cargar categorías'));
          }
        },
      ),
    );
  }
}
