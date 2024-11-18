import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:GsTravel/src/presentation/pages/client/home/ClientCategoryPage.dart';
import 'package:GsTravel/src/presentation/pages/client/home/ClientProductPage%20.dart';
import 'package:GsTravel/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  ClientHomeBloc? _bloc;
  int _selectedIndex =
      0; // Índice del ítem seleccionado en el BottomNavigationBar

  // Lista de páginas a mostrar en el cuerpo del Scaffold
  final List<Widget> _pages = [
    ClientProductPage(),
    ClientCategoryPage(),
    Center(child: Text('Mis Pedidos', style: TextStyle(fontSize: 24))),
    Center(child: Text('Ayuda', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientHomeBloc>(context);

    // Determinar si el AppBar debe mostrarse
    bool showAppBar = _selectedIndex == 0; // Mostrar solo en "Tienda"

    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              backgroundColor: Colors.purple,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Botón para cerrar
                    },
                    icon: Icon(Icons.close, color: Colors.white),
                  ),
                  Text(
                    'GS TRAVEL',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BlocBuilder<ClientShoppingBagBloc, ClientShoppingBagState>(
                    builder: (context, shoppingBagState) {
                      // Calcular la cantidad total de productos en el carrito
                      int totalProductsInCart = shoppingBagState.products
                          .fold(0, (sum, item) => sum + (item.quantity ?? 0));

                      return badges.Badge(
                        showBadge: totalProductsInCart >
                            0, // Mostrar solo si hay productos
                        position: badges.BadgePosition.topEnd(top: 0, end: 3),
                        badgeContent: Text(
                          totalProductsInCart.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart_outlined,
                              color: Colors.white),
                          onPressed: () {
                            // Acción del carrito
                            Navigator.pushNamed(context, 'client/shopping_bag');
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(60), // Altura extendida del AppBar
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white, // Fondo blanco del campo de búsqueda
                      borderRadius:
                          BorderRadius.circular(8), // Bordes redondeados
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black, // Ícono de búsqueda
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Buscar en Tienda',
                              hintStyle: TextStyle(
                                  fontSize: 16, height: 1.3), // Ajusta el texto
                              contentPadding: EdgeInsets.only(
                                  bottom: 7), // Ajusta la posición del texto
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : null, // Oculta el AppBar si no es necesario
      body: _pages[_selectedIndex], // Página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Índice del ítem seleccionado
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Cambia la página seleccionada
          });
        },
        type: BottomNavigationBarType.fixed, // Fija las opciones
        items: [
          _buildBottomNavItem(Icons.store, 'Tienda', 0),
          _buildBottomNavItem(Icons.grid_view, 'Categorías', 1),
          _buildBottomNavItem(Icons.shopping_bag, 'Mis Pedidos', 2),
          _buildBottomNavItem(Icons.headset_mic, 'Ayuda', 3),
        ],
        selectedItemColor: Colors.purple, // Color del ítem seleccionado
        unselectedItemColor: Colors.black54, // Color de ítems no seleccionados
        backgroundColor: Colors.white,
      ),
    );
  }

  // Método para construir los ítems del BottomNavigationBar con círculo de selección
  BottomNavigationBarItem _buildBottomNavItem(
      IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index; // Verifica si está seleccionado
    return BottomNavigationBarItem(
      icon: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.purple.shade100, // Color del círculo
                shape: BoxShape.circle,
              )
            : null,
        padding: EdgeInsets.all(8), // Espaciado dentro del círculo
        child: Icon(icon, color: isSelected ? Colors.purple : Colors.black54),
      ),
      label: label,
    );
  }
}
