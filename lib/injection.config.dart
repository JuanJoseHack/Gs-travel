// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_v2/src/data/dataSource/local/SharedPref.dart'
    as _i990;
import 'package:ecommerce_v2/src/data/dataSource/remote/service/AuthService.dart'
    as _i619;
import 'package:ecommerce_v2/src/data/dataSource/remote/service/CategoriesService.dart'
    as _i262;
import 'package:ecommerce_v2/src/data/dataSource/remote/service/ProductsService.dart'
    as _i334;
import 'package:ecommerce_v2/src/data/dataSource/remote/service/RolesService.dart'
    as _i794;
import 'package:ecommerce_v2/src/data/dataSource/remote/service/UsersService.dart'
    as _i622;
import 'package:ecommerce_v2/src/di/AppModule.dart' as _i179;
import 'package:ecommerce_v2/src/domain/repository/AuthRepository.dart'
    as _i196;
import 'package:ecommerce_v2/src/domain/repository/CategoriesRepository.dart'
    as _i2;
import 'package:ecommerce_v2/src/domain/repository/ProductsRepository.dart'
    as _i1025;
import 'package:ecommerce_v2/src/domain/repository/RolesRepository.dart'
    as _i308;
import 'package:ecommerce_v2/src/domain/repository/UsersRepository.dart'
    as _i533;
import 'package:ecommerce_v2/src/domain/useCase/Auth/AuthUseCases.dart'
    as _i649;
import 'package:ecommerce_v2/src/domain/useCase/categories/CategoriesUseCases.dart'
    as _i591;
import 'package:ecommerce_v2/src/domain/useCase/products/ProductsUseCases.dart'
    as _i590;
import 'package:ecommerce_v2/src/domain/useCase/Roles/RolesUseCases.dart'
    as _i1043;
import 'package:ecommerce_v2/src/domain/useCase/users/UsersUseCases.dart'
    as _i433;
import 'package:get_it/get_it.dart' as _i174;
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
    gh.factory<_i990.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i619.AuthService>(() => appModule.authService);
    gh.factory<_i622.UsersService>(() => appModule.usersService);
    gh.factory<_i262.CategoriesService>(() => appModule.categoriesService);
    gh.factory<_i334.ProductsService>(() => appModule.productsService);
    gh.factory<_i196.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i533.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i2.CategoriesRepository>(() => appModule.categoriesRepository);
    gh.factory<_i1025.ProductsRepository>(() => appModule.productsRepository);
    gh.factory<_i649.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i433.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i591.CategoriesUseCases>(() => appModule.categoriesUseCases);
    gh.factory<_i590.ProductsUseCases>(() => appModule.productsUseCases);
    gh.factory<_i794.RolesService>(() => appModule.rolesService);
    gh.factory<_i308.RolesRepository>(() => appModule.rolesRepository);
    gh.factory<_i1043.RolesUseCases>(() => appModule.rolesUseCases);
    return this;
  }
}

class _$AppModule extends _i179.AppModule {}
