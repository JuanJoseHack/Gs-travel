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
  TouristPlacesModel(
      name: "Atractivos Naturales", image: "assets/icons/mountain.png"),
  TouristPlacesModel(
      name: "Atractivos Culturales", image: "assets/icons/beach.png"),
  TouristPlacesModel(
      name: "Atractivos Recreativos y Termales",
      image: "assets/icons/forest.png"),
  TouristPlacesModel(
      name: "Ecoturismo y Observación de Flora y Fauna",
      image: "assets/icons/city.png"),
];
