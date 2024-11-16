import 'package:GsTravel/src/presentation/pages/client/homestatic/home_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.asset(
                'assets/background1.jpg', // Asegúrate de que el archivo esté en la carpeta correcta
                fit: BoxFit.cover, // Hace que la imagen cubra toda la pantalla
              ),
            ),
            // Efecto de gradiente
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent, // Parte superior transparente
                      Color.fromARGB(43, 0, 0, 0), // Parte inferior más oscura
                    ],
                    stops: [0.5, 1.0], // La transición ocurre a la mitad
                  ),
                ),
              ),
            ),
            // Contenido principal
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Spacer(),
                    // Logo más pequeño
                    Image.asset(
                      'assets/logogs.png',
                      width: 250, // Ajusta el ancho
                      height: 150, // Ajusta la altura
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Explora tu viaje \n con nosotros",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Todos tus destinos de vacaciones están aquí, disfruta de tus vacaciones",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: SizedBox(
                        // Asigna el ancho que deseas al botón
                        width:
                            200, // Puedes ajustar este valor para hacer el botón más pequeño
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 202, 27, 15),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 8.0,
                            ),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text("Comenzar"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
