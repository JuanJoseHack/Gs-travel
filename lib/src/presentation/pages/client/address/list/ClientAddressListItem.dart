import 'package:GsTravel/src/domain/models/Address.dart';
import 'package:GsTravel/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';
import 'package:flutter/material.dart';

class ClientAddressListItem extends StatelessWidget {
  final ClientAddressListBloc? bloc;
  final ClientAddressListState state;
  final Address address;
  final int index;

  ClientAddressListItem(this.bloc, this.state, this.address, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Esquinas redondeadas
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 3), // Sombra ligera
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              leading: Radio(
                value: index,
                groupValue: state.radioValue,
                onChanged: (value) {
                  bloc?.add(
                      ChangeRadioValue(radioValue: value!, address: address));
                },
              ),
              trailing: IconButton(
                onPressed: () {
                  print("Deleting address with id: ${address.id}");
                  bloc?.add(DeleteAddress(id: address.id!));
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(
                address.address,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                address.neighborhood,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
