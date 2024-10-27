import 'package:ecommerce_v2/main.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/category/list/AdminCategoryListPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/product/list/AdminProductListPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  AdminHomeBloc? _bloc;

  List<Widget> pageList = <Widget>[
    AdminCategoryListPage(),
    AdminProductListPage(),
    ProfileInfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminHomeBloc>(context);

    return Scaffold(
        appBar: AppBar(title: Text('Menu')),
        drawer: BlocBuilder<AdminHomeBloc, AdminHomeState>(
          builder: (context, state) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/img/woman.jpg'), // Ruta de la imagen
                          fit: BoxFit
                              .cover, // Ajusta la imagen para que cubra todo el fondo
                        ),
                      ),
                      child: Text(
                        'Menu del Admin',
                        style: TextStyle(color: Colors.white),
                      )),
                  ListTile(
                    leading: Icon(Icons.category),
                    iconColor: Colors.green,
                    title: Text('Categorias'),
                    selected: state.pageIndex == 0,
                    onTap: () {
                      _bloc?.add(AdminChangeDrawerPage(pageIndex: 0));
                      Navigator.pop(context); // cierra el drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    iconColor: Colors.green,
                    title: Text('Productos'),
                    selected: state.pageIndex == 1,
                    onTap: () {
                      _bloc?.add(AdminChangeDrawerPage(pageIndex: 1));
                      Navigator.pop(context); // cierra el drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    iconColor: Colors.green,
                    title: Text('Perfil'),
                    selected: state.pageIndex == 2,
                    onTap: () {
                      _bloc?.add(AdminChangeDrawerPage(pageIndex: 2));
                      Navigator.pop(context); // cierra el drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    iconColor: Colors.green,
                    title: Text('cerrar Sesion'),
                    onTap: () {
                      _bloc?.add(AdminLogout());
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                          (route) => false); // cierra el drawer
                    },
                  )
                ],
              ),
            );
          },
        ),
        body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
            builder: (context, state) {
          return pageList[state.pageIndex];
        }));
  }
}
