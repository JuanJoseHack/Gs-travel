import 'package:ecommerce_v2/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:ecommerce_v2/src/presentation/widgest/custom_icon_button.dart';
import 'package:ecommerce_v2/src/presentation/widgest/location_card.dart';
import 'package:ecommerce_v2/src/presentation/widgest/nearby_places.dart';
import 'package:ecommerce_v2/src/presentation/widgest/recommended_places.dart';
import 'package:ecommerce_v2/src/presentation/widgest/tourist_places.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Índice del BottomNavigationBar

  void _onItemTapped(int index) {
    if (index == 2) {
      // Redirige a ClientHomePage cuando el ícono de tienda es seleccionado
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ClientHomePage(),
        ),
      );
    } else if (index == 3) {
      // Redirige a ProfileInfoPage cuando el ícono de perfil es seleccionado
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileInfoPage(),
        ),
      );
    } else {
      // Manejo de otros íconos
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bienvenido"),
            Text(
              "Juan Jose",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
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
          // LOCATION CARD
          const LocationCard(),
          const SizedBox(height: 15),
          const TouristPlaces(),
          // CATEGORIES
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recomendación",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text("Ver Todo"))
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
              TextButton(onPressed: () {}, child: const Text("Ver todo"))
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
        currentIndex: _selectedIndex, // Establece el índice actual
        onTap: _onItemTapped, // Maneja el evento de tap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmark_outline),
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
