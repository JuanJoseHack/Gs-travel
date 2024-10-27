import 'package:ecommerce_v2/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/CategoriesService.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/ProductsService.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/RolesService.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/UsersService.dart';
import 'package:ecommerce_v2/src/data/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/AuthService.dart';
import 'package:ecommerce_v2/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/repository/ProductsRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/repository/RolesRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/repository/UsersRepositoryImpl.dart';
import 'package:ecommerce_v2/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_v2/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/CategoriesRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/ProductsRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/RolesRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/LoginUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/LogoutUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/RegisterUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Roles/CreateRolesUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Roles/GetRolesUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/Roles/RolesUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/CategoriesUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/DeleteCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/GetCategoriesUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/UpdateCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/CreateProductUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/DeleteProductUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/ProductsUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/UpdateProductUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/users/UpdateUserUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  SharedPref get sharedPref => SharedPref();
  @injectable
  Future<String> get token async {
    String token = "";
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  //services
  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  CategoriesService get categoriesService => CategoriesService(token);

  @injectable
  ProductsService get productsService => ProductsService(token);

//Repository
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharedPref);
  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

  @injectable
  CategoriesRepository get categoriesRepository =>
      CategoriesRepositoryImpl(categoriesService);

  @injectable
  ProductsRepository get productsRepository =>
      ProductsRepositoryImpl(productsService);

  //UseCases
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserSessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository),
      );

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(updateUser: UpdateUserUseCase(usersRepository));

  @injectable
  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
      create: CreateCategoryUseCase(categoriesRepository),
      getCategories: GetCategoriesUseCase(categoriesRepository),
      update: UpdateCategoryUseCase(categoriesRepository),
      delete: DeleteCategoryUseCase(categoriesRepository));

  @injectable
  ProductsUseCases get productsUseCases => ProductsUseCases(
      create: CreateProductUseCase(productsRepository),
      getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
      update: UpdateProductUseCase(productsRepository),
      delete: DeleteProductUseCase(productsRepository));

  //ROLES
  @injectable
  RolesService get rolesService => RolesService();

  @injectable
  RolesRepository get rolesRepository => RolesRepositoryImpl(rolesService);

  @injectable
  RolesUseCases get rolesUseCases => RolesUseCases(
      create: CreateRolesUseCase(rolesRepository),
      getRoles: GetRolesUseCases(rolesRepository));
}
