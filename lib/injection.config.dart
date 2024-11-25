// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:GsTravel/src/data/dataSource/local/SharedPref.dart' as _i260;
import 'package:GsTravel/src/data/dataSource/remote/service/AddressService.dart'
    as _i560;
import 'package:GsTravel/src/data/dataSource/remote/service/AuthService.dart'
    as _i270;
import 'package:GsTravel/src/data/dataSource/remote/service/CategoriesService.dart'
    as _i869;
import 'package:GsTravel/src/data/dataSource/remote/service/MercadoPagoService.dart'
    as _i538;
import 'package:GsTravel/src/data/dataSource/remote/service/OrderService.dart'
    as _i678;
import 'package:GsTravel/src/data/dataSource/remote/service/ProductsService.dart'
    as _i40;
import 'package:GsTravel/src/data/dataSource/remote/service/RolesService.dart'
    as _i304;
import 'package:GsTravel/src/data/dataSource/remote/service/UsersService.dart'
    as _i879;
import 'package:GsTravel/src/di/AppModule.dart' as _i186;
import 'package:GsTravel/src/domain/repository/AddressRepository.dart' as _i46;
import 'package:GsTravel/src/domain/repository/AuthRepository.dart' as _i813;
import 'package:GsTravel/src/domain/repository/CategoriesRepository.dart'
    as _i814;
import 'package:GsTravel/src/domain/repository/MercadoPagoRepository.dart'
    as _i201;
import 'package:GsTravel/src/domain/repository/OrdersRepository.dart' as _i217;
import 'package:GsTravel/src/domain/repository/ProductsRepository.dart'
    as _i1042;
import 'package:GsTravel/src/domain/repository/RolesRepository.dart' as _i756;
import 'package:GsTravel/src/domain/repository/ShoppingBagRepository.dart'
    as _i739;
import 'package:GsTravel/src/domain/repository/UsersRepository.dart' as _i243;
import 'package:GsTravel/src/domain/useCase/address/AddressUseCases.dart'
    as _i127;
import 'package:GsTravel/src/domain/useCase/Auth/AuthUseCases.dart' as _i222;
import 'package:GsTravel/src/domain/useCase/categories/CategoriesUseCases.dart'
    as _i88;
import 'package:GsTravel/src/domain/useCase/MercadoPago/MercadoPagoUseCases.dart'
    as _i989;
import 'package:GsTravel/src/domain/useCase/Order/OrdersUseCases.dart' as _i341;
import 'package:GsTravel/src/domain/useCase/products/ProductsUseCases.dart'
    as _i328;
import 'package:GsTravel/src/domain/useCase/Roles/RolesUseCases.dart' as _i1010;
import 'package:GsTravel/src/domain/useCase/ShoppingBag/ShoppingBagUseCases.dart'
    as _i27;
import 'package:GsTravel/src/domain/useCase/users/UsersUseCases.dart' as _i269;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i260.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i270.AuthService>(() => appModule.authService);
    gh.factory<_i879.UsersService>(() => appModule.usersService);
    gh.factory<_i869.CategoriesService>(() => appModule.categoriesService);
    gh.factory<_i40.ProductsService>(() => appModule.productsService);
    gh.factory<_i304.RolesService>(() => appModule.rolesService);
    gh.factory<_i560.AddressService>(() => appModule.addressService);
    gh.factory<_i538.MercadoPagoService>(() => appModule.mercadoPagoService);
    gh.factory<_i678.OrderService>(() => appModule.orderService);
    gh.factory<_i813.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i243.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i814.CategoriesRepository>(
        () => appModule.categoriesRepository);
    gh.factory<_i1042.ProductsRepository>(() => appModule.productsRepository);
    gh.factory<_i756.RolesRepository>(() => appModule.rolesRepository);
    gh.factory<_i739.ShoppingBagRepository>(
        () => appModule.shoppingBagRepository);
    gh.factory<_i46.AddressRepository>(() => appModule.addressRepository);
    gh.factory<_i201.MercadoPagoRepository>(
        () => appModule.mercadoPagoRepository);
    gh.factory<_i217.OrdersRepository>(() => appModule.ordersRepository);
    gh.factory<_i222.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i269.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i88.CategoriesUseCases>(() => appModule.categoriesUseCases);
    gh.factory<_i328.ProductsUseCases>(() => appModule.productsUseCases);
    gh.factory<_i1010.RolesUseCases>(() => appModule.rolesUseCases);
    gh.factory<_i27.ShoppingBagUseCases>(() => appModule.shoppingBagUseCases);
    gh.factory<_i127.AddressUseCases>(() => appModule.addressUseCases);
    gh.factory<_i989.MercadoPagoUseCases>(() => appModule.mercadoPagoUseCases);
    gh.factory<_i341.OrdersUseCases>(() => appModule.ordersUseCases);
    return this;
  }
}

class _$AppModule extends _i186.AppModule {}
