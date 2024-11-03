import 'package:flutter/material.dart';
import 'upload_evidence_page.dart';

class YapeQrPage extends StatefulWidget {
  final double amount;
  final String phoneNumber;

  YapeQrPage({required this.amount, required this.phoneNumber});

  @override
  _YapeQrPageState createState() => _YapeQrPageState();
}

class _YapeQrPageState extends State<YapeQrPage> {
  String _selectedPaymentMethod = 'yape';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagar con Yape o Plin"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Escoge tu método de pago"),
            ToggleButtons(
              isSelected: [
                _selectedPaymentMethod == 'yape',
                _selectedPaymentMethod == 'plin'
              ],
              onPressed: (index) {
                setState(() {
                  _selectedPaymentMethod = index == 0 ? 'yape' : 'plin';
                });
              },
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Yape"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Plin"),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_selectedPaymentMethod == 'yape')
              Image.asset('assets/img/qryape.jpg', width: 200, height: 200)
            else
              Image.asset('assets/img/qrplin.jpg', width: 200, height: 200),
            SizedBox(height: 20),
            Text("Monto: S/ ${widget.amount.toStringAsFixed(2)}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadEvidencePage(
                      amount: widget.amount,
                      paymentMethod: _selectedPaymentMethod,
                      userId: "user123", // Reemplaza con el ID real del usuario
                      phoneNumber:
                          "123456789", // Reemplaza con el número de teléfono realeemplaza con el ID real del usuario
                    ),
                  ),
                );
              },
              child: Text("Subir Evidencia de Pago"),
            ),
          ],
        ),
      ),
    );
  }
}
