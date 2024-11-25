import 'package:GsTravel/src/domain/models/Address.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/address/list/ClientAddressListItem.dart';
import 'package:GsTravel/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientAddressListPage extends StatefulWidget {
  const ClientAddressListPage({super.key});

  @override
  State<ClientAddressListPage> createState() => _ClientAddressListPageState();
}

class _ClientAddressListPageState extends State<ClientAddressListPage> {
  ClientAddressListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetUserAddress());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientAddressListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 158, 11),
        iconTheme: IconThemeData(
          color: Colors.white, // Cambia el color del ícono de retroceso
        ),
        title: Text(
          'Mis direcciones',
          style: TextStyle(
              fontWeight: FontWeight.bold, // Negrita
              fontSize: 20,
              color: Colors.white // Tamaño del texto
              ),
          textAlign: TextAlign.center, // Centrado del texto
        ),
        centerTitle: true, // Asegura el centrado del título
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, 'client/address/create'); // Función del ícono
            },
            icon: Icon(
              Icons.add,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'client/payment/form');
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: BlocListener<ClientAddressListBloc, ClientAddressListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              // SI LA DIRECCIÓN SE BORRÓ CORRECTAMENTE
              _bloc?.add(GetUserAddress());
            }
          }
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ClientAddressListBloc, ClientAddressListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              List<Address> address = responseState.data as List<Address>;
              _bloc?.add(SetAddressSession(addressList: address));
              return ListView.builder(
                itemCount: address.length,
                itemBuilder: (context, index) {
                  return ClientAddressListItem(
                      _bloc, state, address[index], index);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
