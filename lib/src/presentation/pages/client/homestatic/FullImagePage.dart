import 'package:flutter/material.dart';

class FullImagePage extends StatelessWidget {
  final String image;

  const FullImagePage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Volver atrás al tocar la imagen
          },
          child: Center(
            child: Hero(
              tag: image,
              child: Image.asset(
                image,
                fit: BoxFit
                    .contain, // Ajustar la imagen para que se muestre completa
              ),
            ),
          ),
        ),
      ),
    );
  }
}
