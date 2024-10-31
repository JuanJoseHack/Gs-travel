import 'package:ecommerce_v2/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:ecommerce_v2/src/presentation/widgest/custom_icon_button.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/homestatic/location_card.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/homestatic/nearby_places.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/homestatic/recommended_places.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/homestatic/tourist_places.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Índice del BottomNavigationBar

  // Lista de páginas para cada índice
  final List<Widget> _pages = [
    const HomeContent(), // Contenido para Home
    const Center(child: Text("Bookmark")), // Bookmark Page
    const ClientHomePage(), // Store Page
    const ProfileInfoPage(), // Profile Page
  ];

  // Método para cambiar el índice seleccionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 // Mostrar AppBar solo en HomeContent
          ? AppBar(
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
            )
          : null, // No mostrar AppBar en las otras páginas
      body: IndexedStack(
        index: _selectedIndex, // Muestra la página correspondiente al índice
        children: _pages,
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

// Contenido principal para la pestaña Home
class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            TextButton(onPressed: () {}, child: const Text("Ver todo")),
          ],
        ),
        const SizedBox(height: 10),
        const NearbyPlaces(),
      ],
    );
  }
}
