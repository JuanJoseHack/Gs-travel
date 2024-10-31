class RecommendedPlaceModel {
  final String name;
  final String image;
  final double rating;
  final String location;
  final String estimatedTime;
  final String description; // Nueva propiedad de descripción

  RecommendedPlaceModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.location,
    required this.estimatedTime,
    required this.description, // Inicializamos la descripción
  });
}

// Datos de ejemplo con descripción única para cada lugar
List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    name: "Castillo de Lamas",
    image: "assets/places/place1.jpg",
    rating: 4.4,
    location: "San Martín",
    estimatedTime: "01d:02h:10m",
    description:
        "Un hermoso castillo ubicado en la selva peruana.", // Descripción única
  ),
  RecommendedPlaceModel(
    name: "Laguna Azul",
    image: "assets/places/place4.jpg",
    rating: 4.4,
    location: "Tarapoto",
    estimatedTime: "02d:12h:35m",
    description:
        "Una laguna de aguas cristalinas ideal para relajarse.", // Descripción única
  ),
  RecommendedPlaceModel(
    name: "Machupichu",
    image: "assets/places/place3.jpg",
    rating: 4.4,
    location: "Cusco",
    estimatedTime: "03d:22h:20m",
    description:
        "Una de las maravillas del mundo moderno en los Andes.", // Descripción única
  ),
  RecommendedPlaceModel(
    name: "Catarata Ahushiyacu",
    image: "assets/places/place2.jpg",
    rating: 4.4,
    location: "San Martín",
    estimatedTime: "00d:10h:45m",
    description:
        "Una impresionante catarata rodeada de vegetación.", // Descripción única
  ),
];
