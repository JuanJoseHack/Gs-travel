import 'package:GsTravel/src/presentation/pages/client/address/create/bloc/ClientAddressCreateBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:GsTravel/src/presentation/utils/BlocFormItem.dart';
import 'package:GsTravel/src/presentation/widgest/DefaultTextField.dart';
import 'package:flutter/material.dart';

class ClientAddressCreateContent extends StatelessWidget {
  ClientAddressCreateBloc? bloc;
  ClientAddressCreateState state;

  ClientAddressCreateContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 158, 11),
        title: Text(
          'Nueva Dirección',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Cambiar color de la flecha a blanco
        ),
      ),
      body: Form(
        key: state.formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerIcon(context),
                SizedBox(height: 20),
                _textFieldAddress(),
                SizedBox(height: 15),
                _textFieldNeighborhood(),
                SizedBox(height: 30),
                _submitButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerIcon(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 40, 158, 11),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.location_on,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textFieldAddress() {
    return DefaultTextField(
      label: 'Dirección',
      icon: Icons.my_location,
      onChanged: (text) {
        bloc?.add(AddressChanged(address: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.address.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldNeighborhood() {
    return DefaultTextField(
      label: 'Barrio',
      icon: Icons.location_city,
      onChanged: (text) {
        bloc?.add(NeighborhoodChanged(neighborhood: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.neighborhood.error;
      },
      color: Colors.black,
    );
  }

  Widget _submitButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(FormSubmit());
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 40, 158, 11),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          'Guardar Dirección',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
