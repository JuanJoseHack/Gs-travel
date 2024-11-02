import 'package:flutter/material.dart';

class EditAddressPage extends StatefulWidget {
  final Function(String) onSaveAddress;

  const EditAddressPage({Key? key, required this.onSaveAddress})
      : super(key: key);

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 165, 41),
        title: const Text(
          'Confirmar dirección',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Completa los últimos datos",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "(*) Obligatorio",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 15),
            _buildTextField("Dirección de entrega*", _addressController,
                hintText: "Ej.: Av. Javier Prado."),
            const SizedBox(height: 15),
            _buildTextField("Departamento*", _departmentController),
            const SizedBox(height: 15),
            _buildTextField("Provincia*", _provinceController),
            const SizedBox(height: 15),
            _buildTextField("Distrito*", _districtController),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    "Nro./Mz./Etapa*",
                    _numberController,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildTextField(
                    "Dpto./Int./Lt.",
                    _apartmentController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            _buildTextField("Referencia de tu ubicación", _referenceController,
                hintText: "Atrás de la espalda del hotel san Marino"),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Construye la dirección completa
                  String fullAddress = _addressController.text;
                  widget.onSaveAddress(fullAddress);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Guardar dirección",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {String? hintText}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
