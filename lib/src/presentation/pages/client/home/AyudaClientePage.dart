import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(YapeHelpCenterApp());
}

class YapeHelpCenterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelpCenterPage(),
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  final String whatsappUrl =
      'https://wa.me/51906267802?text=¡Hola!%20Estoy%20en%20el%20app%20y%20quiero%20más%20información%20sobre%20GS%20TRAVEL.';
  // Mensaje predefinido al abrir el enlace

  void _launchWhatsApp() async {
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'No se pudo abrir el enlace de WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 158, 11),
        title: Text(
          'Centro de Ayuda - GS TRAVEL',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white, // Color blanco para el título
          ),
        ),
        centerTitle: true, // Para centrar el título
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, // Color blanco para el botón de retroceso
          ),
          onPressed: () {
            Navigator.pop(context); // Acción para retroceder
          },
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white, // Color blanco para el ícono de WhatsApp
            ),
            onPressed: _launchWhatsApp,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Contáctanos'),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.whatsapp,
                color: const Color.fromARGB(255, 40, 158, 11)),
            title: Text('Escríbenos por WhatsApp'),
            onTap: _launchWhatsApp,
          ),
          SizedBox(height: 20),
          _buildSectionTitle('Nuestros traveleros preguntan'),
          _buildListTile('Lo básico de GS TRAVEL', Icons.store),
          _buildListTile('¿Dónde veo el estado de mi pedido?', Icons.search),
          _buildListTile(
              '¿Qué hago si mi pedido no llega?', Icons.help_outline),
          _buildListTile('¿Cómo entregan mi pedido?', Icons.local_shipping),
          _buildListTile('Cambios y cancelaciones', Icons.settings),
          _buildListTile('Tengo otro problema', Icons.warning),
          SizedBox(height: 20),
          _buildSectionTitle('Otros temas'),
          _buildListTile('Libro de reclamaciones', Icons.book),
          _buildListTile('Términos y condiciones', Icons.description),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 40, 158, 11),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 40, 158, 11)),
      title: Text(title),
      onTap: () {
        // Puedes agregar acciones específicas para cada opción aquí
        print('$title seleccionado');
      },
    );
  }
}
