import 'package:GsTravel/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/status/ClientPaymentStatusContent.dart';
import 'package:flutter/material.dart';

class ClientPaymentStatusPage extends StatefulWidget {
  const ClientPaymentStatusPage({super.key});

  @override
  State<ClientPaymentStatusPage> createState() =>
      _ClientPaymentStatusPageState();
}

class _ClientPaymentStatusPageState extends State<ClientPaymentStatusPage> {
  MercadoPagoPaymentResponse2? paymentResponse;

  @override
  Widget build(BuildContext context) {
    paymentResponse = ModalRoute.of(context)?.settings.arguments
        as MercadoPagoPaymentResponse2;
    return Scaffold(
      body: ClientPaymentStatusContent(paymentResponse),
    );
  }
}
