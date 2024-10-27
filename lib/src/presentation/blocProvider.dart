import 'package:ecommerce_v2/injection.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/CategoriesUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/ProductsUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/users/UsersUseCases.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/product/list/bloc/ClienteProductListBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/roles/bloc/RolesEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<RolesBloc>(
      create: (context) =>
          RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  BlocProvider<AdminHomeBloc>(
      create: (context) => AdminHomeBloc(locator<AuthUseCases>())),
  BlocProvider<ProfileInfoBloc>(
      create: (context) =>
          ProfileInfoBloc(locator<AuthUseCases>())..add(ProfileInfoGetUser())),
  BlocProvider<ProfileUpdateBloc>(
      create: (context) =>
          ProfileUpdateBloc(locator<UsersUseCases>(), locator<AuthUseCases>())),
  BlocProvider<AdminCategoryCreateBloc>(
      create: (context) =>
          AdminCategoryCreateBloc(locator<CategoriesUseCases>())
            ..add(AdminCategoryCreateInitEvent())),
  BlocProvider<AdminCategoryListBloc>(
      create: (context) =>
          AdminCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminCategoryCreateBloc>(
      create: (context) =>
          AdminCategoryCreateBloc(locator<CategoriesUseCases>())
            ..add(AdminCategoryCreateInitEvent())),
  BlocProvider<AdminCategoryUpdateBloc>(
      create: (context) =>
          AdminCategoryUpdateBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminProductListBloc>(
      create: (context) => AdminProductListBloc(locator<ProductsUseCases>())),
  BlocProvider<AdminProductCreateBloc>(
      create: (context) => AdminProductCreateBloc(locator<ProductsUseCases>())),
  BlocProvider<AdminProductUpdateBloc>(
      create: (context) => AdminProductUpdateBloc(locator<ProductsUseCases>())),
  BlocProvider<ClienteCategoryListBloc>(
      create: (context) =>
          ClienteCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<ClienteProductListBloc>(
      create: (context) => ClienteProductListBloc(locator<ProductsUseCases>())),
  BlocProvider<ClientHomeBloc>(
      create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
];
