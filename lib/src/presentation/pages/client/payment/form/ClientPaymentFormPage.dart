import 'package:GsTravel/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/form/ClientPaymentFormContent.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:GsTravel/src/presentation/widgest/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientPaymentFormPage extends StatefulWidget {
  const ClientPaymentFormPage({super.key});

  @override
  State<ClientPaymentFormPage> createState() => _ClientPaymentFormPageState();
}

class _ClientPaymentFormPageState extends State<ClientPaymentFormPage> {
  ClientPaymentFormBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientPaymentFormBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de pagos'),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 15, left: 30, right: 30),
        child: DefaultButton(
            text: 'Continuar',
            onPressed: () {
              _bloc?.add(FormSubmit());
            }),
      ),
      body: BlocListener<ClientPaymentFormBloc, ClientPaymentFormState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            // _bloc?.add(ResetForm());
            MercadoPagoCardTokenResponse response =
                responseState.data as MercadoPagoCardTokenResponse;
            print('Respuesta Card Token: ${response.toJson()}');
            Navigator.pushNamedAndRemoveUntil(
                context, 'client/payment/installments', (route) => false,
                arguments: {
                  'mercadoPagoCardTokenResponse': response,
                  'amount': state.totalToPay.toString()
                });
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ClientPaymentFormBloc, ClientPaymentFormState>(
          builder: (context, state) {
            return ClientPaymentFormContent(_bloc, state);
          },
        ),
      ),
    );
  }
}
