import 'package:GsTravel/src/presentation/pages/client/homestatic/FullImagePage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TouristDetailsPage extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final double rating;
  final String description;
  final String estimatedTime;
  final List<String> recommendations; // Cambiado a lista para viñetas
  final List<String> precautions; // Cambiado a lista para viñetas

  const TouristDetailsPage({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.description,
    required this.estimatedTime,
    required this.recommendations,
    required this.precautions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            // Imagen con clic para pantalla completa
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullImagePage(image: image),
                      ),
                    );
                  },
                  child: Hero(
                    tag: image,
                    child: SizedBox(
                      height: size.height * 0.38,
                      width: double.maxFinite,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: -5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 22,
                          icon: const Icon(Ionicons.chevron_back),
                        ),
                        IconButton(
                          iconSize: 22,
                          onPressed: () {
                            // Lógica de favoritos aquí
                          },
                          icon: const Icon(Ionicons.heart_outline),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Información del lugar
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: 20,
                      icon: const Icon(Ionicons.chatbubble_ellipses_outline),
                    ),
                    const SizedBox(width: 5),
                    Row(
                      children: [
                        Text(
                          rating.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          Ionicons.star,
                          color: Colors.yellow[700],
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Tiempo estimado para llegar
            Text(
              estimatedTime,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),

            const SizedBox(height: 15),

            // Descripción del lugar
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 20),

            // Recomendaciones
            if (recommendations.isNotEmpty) ...[
              Text(
                "Recomendaciones",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recommendations
                    .map(
                      (item) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "• ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
            ],

            // Precauciones
            if (precautions.isNotEmpty) ...[
              Text(
                "Precauciones",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: precautions
                    .map(
                      (item) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "• ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
            ],

            // Botón de unirse al tour
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8.0,
                ),
              ),
              child: const Text("Únete a este tour"),
            ),
          ],
        ),
      ),
    );
  }
}
