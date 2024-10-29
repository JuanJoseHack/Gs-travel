class RecommendedPlaceModel {
  final String name;
  final String image;
  final double rating;
  final String location;

  RecommendedPlaceModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    name: "Castillo de Lamas",
    image: "assets/places/place1.jpg",
    rating: 4.4,
    location: "San Martín",
  ),
  RecommendedPlaceModel(
    name: "Laguna Azul",
    image: "assets/places/place4.jpg",
    rating: 4.4,
    location: "Tarapoto",
  ),
  RecommendedPlaceModel(
    name: "Machupichu",
    image: "assets/places/place3.jpg",
    rating: 4.4,
    location: "Cusco",
  ),
  RecommendedPlaceModel(
    name: "Catarata Ahushiyacu",
    image: "assets/places/place2.jpg",
    rating: 4.4,
    location: "San Martín",
  ),
  RecommendedPlaceModel(
    name: "San Ramón",
    image: "assets/places/place5.jpg",
    rating: 4.4,
    location: "Junín",
  ),
];
