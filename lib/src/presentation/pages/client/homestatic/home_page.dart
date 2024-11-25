import 'package:GsTravel/src/presentation/pages/client/homestatic/location_card.dart';
import 'package:GsTravel/src/presentation/pages/client/homestatic/nearby_places.dart';
import 'package:GsTravel/src/presentation/pages/client/homestatic/recommended_places.dart';
import 'package:GsTravel/src/presentation/pages/client/homestatic/tourist_places.dart';
import 'package:GsTravel/src/presentation/widgest/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:GsTravel/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:GsTravel/src/presentation/pages/profile/info/bloc/ProfileInfoState.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, 'home'); // Ruta para Home
        break;
      case 1:
        Navigator.pushReplacementNamed(context, ''); // Ruta para Bookmark
        break;
      case 2:
        Navigator.pushReplacementNamed(
            context, 'client/home'); // Ruta para Store
        break;
      case 3:
        Navigator.pushNamed(context, 'profile/info'); // Ruta para Profile
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
          builder: (context, state) {
            final userName = state.user?.name ?? "Usuario"; // Nombre dinámico
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bienvenido"),
                Text(
                  userName,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            );
          },
        ),
        actions: const [
          CustomIconButton(
            icon: Icon(Ionicons.search_outline),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 12),
            child: CustomIconButton(
              icon: Icon(Ionicons.notifications_outline),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const LocationCard(),
          const SizedBox(height: 15),
          const TouristPlaces(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recomendación",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text("Ver Todo")),
            ],
          ),
          const SizedBox(height: 10),
          const RecommendedPlaces(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cerca de ti",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text("Ver Todo")),
            ],
          ),
          const SizedBox(height: 10),
          const NearbyPlaces(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbox_outline),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.storefront_outline),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
