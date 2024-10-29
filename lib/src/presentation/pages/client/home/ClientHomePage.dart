import 'package:ecommerce_v2/main.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/category/list/ClienteCategoryListPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart'; // Asegúrate de importar Ionicons

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  ClientHomeBloc? _bloc;

  int _selectedIndex = 0; // Índice del BottomNavigationBar

  // Lista de páginas a mostrar en cada índice
  List<Widget> pageList = <Widget>[
    ClienteCategoryListPage(),
    Center(child: Text("Bookmark")),
    Center(child: Text("Store")),
    Center(child: Text("Profile")),
  ];

  // Método para manejar la navegación entre las páginas
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientHomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/woman.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Text(
                    'Menu de opciones',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  iconColor: Colors.green,
                  title: const Text('Categorias'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(ClientChangeDrawerPage(pageIndex: 0));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  iconColor: Colors.green,
                  title: const Text('Cerrar Sesion'),
                  onTap: () {
                    _bloc?.add(ClientLogout());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      body: pageList[
          _selectedIndex], // Muestra la página correspondiente al índice seleccionado
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
