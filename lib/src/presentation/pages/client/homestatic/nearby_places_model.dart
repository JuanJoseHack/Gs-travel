class NearbyPlaceModel {
  final String image;
  final String name; // Nombre del lugar
  final String location; // Ubicación del lugar
  final String estimatedTime; // Tiempo estimado para llegar
  final String description; // Descripción del lugar

  NearbyPlaceModel({
    required this.image,
    required this.name,
    required this.location,
    required this.estimatedTime,
    required this.description,
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    image: "assets/places/place7.jpg",
    name: "Laguna Azul",
    location: "Tarapoto",
    estimatedTime: "01d:32h:56m",
    description: "Un hermoso lugar rodeado de naturaleza y tranquilidad.",
  ),
  NearbyPlaceModel(
    image: "assets/places/place6.jpg",
    name: "Catarata de Ahuashiyacu",
    location: "San Martín",
    estimatedTime: "00d:12h:30m",
    description: "Catarata impresionante en medio de la selva peruana.",
  ),
  NearbyPlaceModel(
    image: "assets/places/place5.jpg",
    name: "Bosque de Piedra",
    location: "Huancayo",
    estimatedTime: "02d:05h:15m",
    description: "Formaciones rocosas naturales con vistas espectaculares.",
  ),
];
