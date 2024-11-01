import 'package:ecommerce_v2/main.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/category/list/ClienteCategoryListPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  ClientHomeBloc? _bloc;

  List<Widget> pageList = <Widget>[ClienteCategoryListPage()];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientHomeBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Tienda'),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                          fit: BoxFit.cover)),
                  child: Text(
                    'Menu de opciones',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  iconColor: const Color.fromARGB(255, 0, 0, 0),
                  title: Text('Categorias'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(ClientChangeDrawerPage(pageIndex: 0));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  iconColor: const Color.fromARGB(255, 0, 0, 0),
                  title: Text('Cerrar Sesion'),
                  onTap: () {
                    _bloc?.add(ClientLogout());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false);
                  },
                ),
              ],
            ),
          );
        }),
        body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
            builder: (context, state) {
          return pageList[state.pageIndex];
        }));
  }
}
