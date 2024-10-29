import 'package:ecommerce_v2/injection.dart';
import 'package:ecommerce_v2/src/presentation/blocProvider.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/category/create/AdminCategoryCreatePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/category/update/AdminCategoryUpdatePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/product/create/AdminProductCreatePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/product/list/AdminProductListPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/product/update/AdminProductUpdatePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/home_page.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/product/list/ClienteProductListPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/update/ProfileUpdatePage.dart';
import 'package:ecommerce_v2/src/presentation/pages/roles/RolesPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(); //para la inyeccion de dependencia
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(), //activar toas global app
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'welcome': (BuildContext context) => WelcomePage(),
          'register': (BuildContext context) => RegisterPage(),
          'profile/info': (BuildContext context) => ProfileInfoPage(),
          'profile/update': (BuildContext context) => ProfileUpdatePage(),
          'roles': (BuildContext context) => RolesPage(),
          'client/home': (BuildContext context) => ClientHomePage(),
          'admin/home': (BuildContext context) => AdminHomePage(),
          'admin/category/create': (BuildContext context) =>
              AdminCategoryCreatePage(),
          'admin/category/update': (BuildContext context) =>
              AdminCategoryUpdatePage(),
          'admin/product/list': (BuildContext context) =>
              AdminProductListPage(),
          'admin/product/create': (BuildContext context) =>
              AdminProductCreatePage(),
          'admin/product/update': (BuildContext context) =>
              AdminProductUpdatePage(),
          'client/product/list': (BuildContext context) =>
              ClientProductListPage(),
        },
      ),
    );
  }
}