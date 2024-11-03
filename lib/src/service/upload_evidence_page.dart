import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as https;

class UploadEvidencePage extends StatefulWidget {
  final double amount;
  final String paymentMethod; // 'yape' o 'plin'
  final String userId; // ID del usuario para asociarlo con el pago
  final String phoneNumber; // Número de teléfono del usuario para el pago

  UploadEvidencePage({
    required this.amount,
    required this.paymentMethod,
    required this.userId,
    required this.phoneNumber,
  });

  @override
  _UploadEvidencePageState createState() => _UploadEvidencePageState();
}

class _UploadEvidencePageState extends State<UploadEvidencePage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;

  // Método para seleccionar imagen de la galería
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Método para subir la evidencia al servidor
  Future<void> _uploadEvidence() async {
    if (_selectedImage == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      final request = https.MultipartRequest(
        'POST',
        Uri.parse('https://gs-bankend-production.up.railway.app/payments'),
      );

      // Asegurarse de que los campos se envían con los tipos correctos
      request.fields['userId'] = widget.userId;
      request.fields['amount'] = widget.amount.toString();
      request.fields['phoneNumber'] = widget.phoneNumber;
      request.fields['paymentMethod'] = widget.paymentMethod;

      // Enviar el archivo como 'evidenceUrl' para que coincida con el backend
      request.files.add(await https.MultipartFile.fromPath(
        'evidenceUrl',
        _selectedImage!.path,
      ));

      final response = await request.send();

      setState(() {
        _isUploading = false;
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Evidencia de pago subida con éxito')),
        );
        Navigator.pop(context);
      } else {
        final responseBody = await response.stream.bytesToString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Error al subir la evidencia de pago: $responseBody')),
        );
        print('Error al subir la evidencia de pago: $responseBody');
      }
    } catch (e) {
      print("Error en la solicitud de subida de evidencia: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la solicitud: $e')),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subir Evidencia de Pago"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Monto: S/ ${widget.amount.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _selectedImage != null
                ? Image.file(_selectedImage!, width: 200, height: 200)
                : Text("No se ha seleccionado ninguna imagen"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Seleccionar Captura de Pantalla"),
            ),
            const SizedBox(height: 20),
            _isUploading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _uploadEvidence,
                    child: Text("Confirmar y Subir Evidencia"),
                  ),
          ],
        ),
      ),
    );
  }
}
