import 'package:GsTravel/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:GsTravel/src/presentation/widgest/DefaultButton.dart';
import 'package:flutter/material.dart';

class ClientPaymentStatusContent extends StatelessWidget {
  final MercadoPagoPaymentResponse2? paymentResponse;

  ClientPaymentStatusContent(this.paymentResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paymentResponse?.status == 'approved'
          ? Colors.green[50]
          : Colors.red[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _iconStatus(),
            const SizedBox(height: 20),
            _textInfo(),
            const SizedBox(height: 10),
            _textStatus(),
            const SizedBox(height: 20),
            _textMessage(),
            const SizedBox(height: 30),
            _buttonFinish(context),
          ],
        ),
      ),
    );
  }

  Widget _buttonFinish(BuildContext context) {
    return DefaultButton(
      text: 'Finalizar',
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          'client/home',
          (route) => false,
        );
      },
      color: paymentResponse?.status == 'approved'
          ? Colors.green[700] ?? Colors.green
          : Colors.red[700] ?? Colors.red,
      colorText: Colors.white,
    );
  }

  Widget _textMessage() {
    return Text(
      paymentResponse?.status == 'approved'
          ? 'Puedes ver el estado de tu pedido en la sección MIS PEDIDOS.'
          : 'Verifica los datos de tu tarjeta e inténtalo nuevamente.',
      style: TextStyle(
        fontSize: 16,
        color: paymentResponse?.status == 'approved'
            ? Colors.green[800]
            : Colors.red[800],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _textStatus() {
    return Text(
      paymentResponse?.status == 'approved'
          ? 'Tu orden fue procesada exitosamente usando (${paymentResponse?.payment_method_id}).'
          : 'Tu pago fue rechazado.',
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _textInfo() {
    return Text(
      paymentResponse?.status == 'approved'
          ? '¡GRACIAS POR TU COMPRA!'
          : 'Error en la transacción',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: paymentResponse?.status == 'approved'
            ? Colors.green[800]
            : Colors.red[800],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _iconStatus() {
    return Icon(
      paymentResponse?.status == 'approved'
          ? Icons.check_circle_outline
          : Icons.cancel_outlined,
      color: paymentResponse?.status == 'approved'
          ? Colors.green[600]
          : Colors.red[600],
      size: 100,
    );
  }
}
