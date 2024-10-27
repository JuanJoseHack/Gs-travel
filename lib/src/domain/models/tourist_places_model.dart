// ignore_for_file: public_member_api_docs, sort_constructors_first
class TouristPlacesModel {
  final String name;
  final String image;
  TouristPlacesModel({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModel> touristPlaces = [
  TouristPlacesModel(name: "Montaña", image: "assets/icons/mountain.png"),
  TouristPlacesModel(name: "Playa", image: "assets/icons/beach.png"),
  TouristPlacesModel(name: "Bosque", image: "assets/icons/forest.png"),
  TouristPlacesModel(name: "Ciudad", image: "assets/icons/city.png"),
  TouristPlacesModel(name: "Desierto", image: "assets/icons/desert.png"),
];
