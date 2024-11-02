import 'package:ecommerce_v2/src/domain/models/Product.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/product/list/ClienteProductListItem.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/product/list/bloc/ClienteProductListBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/product/list/bloc/ClienteProductListEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/product/list/bloc/ClienteProductListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientProductListPage extends StatefulWidget {
  final String searchQuery;

  const ClientProductListPage({Key? key, required this.searchQuery})
      : super(key: key);

  @override
  State<ClientProductListPage> createState() => _ClientProductListPageState();
}

class _ClientProductListPageState extends State<ClientProductListPage> {
  ClienteProductListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc?.add(GetProductsByCategory(idCategory: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClienteProductListBloc>(context);
    return Scaffold(
        body: BlocListener<ClienteProductListBloc, ClienteProductListState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
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
            // Filtra los productos según el término de búsqueda
            List<Product> filteredProducts = products
                .where((product) => product.name
                    .toLowerCase()
                    .contains(widget.searchQuery.toLowerCase()))
                .toList();

            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ClientProductListItem(product: filteredProducts[index]);
              },
            );
          }
          return Container();
        },
      ),
    ));
  }
}
