import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/Orders/ClienteOrderListItem.dart';
import 'package:GsTravel/src/presentation/pages/client/Orders/bloc/ClienteOrderListBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/Orders/bloc/ClienteOrderListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/Orders/bloc/ClienteOrderListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClienteOrderListPage extends StatefulWidget {
  const ClienteOrderListPage({super.key});

  @override
  State<ClienteOrderListPage> createState() => _ClienteOrderListPageState();
}

class _ClienteOrderListPageState extends State<ClienteOrderListPage> {
  late ClienteOrderListBloc _bloc;

  @override
  void initState() {
    super.initState();
    // Se obtiene el clienteId del usuario logueado, por ejemplo.
    int clientId = 123; // Este valor debe ser el ID del cliente logueado.
    _bloc.add(LoadClienteOrders(clientId: clientId));
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClienteOrderListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: BlocListener<ClienteOrderListBloc, ClienteOrderListState>(
        listener: (context, state) {
          final responseState = state.orders;
          if (responseState is Success) {
            // Si la respuesta es exitosa, puedes manejar la lógica adicional aquí.
          }
          if (responseState is Error) {
            Fluttertoast.showToast(
              msg: state.errorMessage ?? 'An error occurred',
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
        child: BlocBuilder<ClienteOrderListBloc, ClienteOrderListState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final orders = state.orders?.data;
            if (orders == null || orders.isEmpty) {
              return const Center(child: Text('No orders found.'));
            }
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return ClienteOrderListItem(order: orders[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
