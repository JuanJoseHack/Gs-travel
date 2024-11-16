import 'package:GsTravel/src/data/dataSource/local/SharedPref.dart';
import 'package:GsTravel/src/data/dataSource/remote/service/AddressService.dart';
import 'package:GsTravel/src/data/dataSource/remote/service/AuthService.dart';
import 'package:GsTravel/src/data/dataSource/remote/service/CategoriesService.dart';
import 'package:GsTravel/src/data/dataSource/remote/service/ProductsService.dart';
import 'package:GsTravel/src/data/dataSource/remote/service/RolesService.dart';
import 'package:GsTravel/src/data/dataSource/remote/service/UsersService.dart';
import 'package:GsTravel/src/data/repository/AddressRepositoryImpl.dart';
import 'package:GsTravel/src/data/repository/AuthRepositoryImpl.dart';
import 'package:GsTravel/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:GsTravel/src/data/repository/ProductsRepositoryImpl.dart';
import 'package:GsTravel/src/data/repository/RolesRepositoryImpl.dart';
import 'package:GsTravel/src/data/repository/ShoppingBagRepositoryImpl.dart';
import 'package:GsTravel/src/data/repository/UsersRepositoryImpl.dart';
import 'package:GsTravel/src/domain/models/AuthResponse.dart';
import 'package:GsTravel/src/domain/repository/AddressRepository.dart';
import 'package:GsTravel/src/domain/repository/AuthRepository.dart';
import 'package:GsTravel/src/domain/repository/CategoriesRepository.dart';
import 'package:GsTravel/src/domain/repository/ProductsRepository.dart';
import 'package:GsTravel/src/domain/repository/RolesRepository.dart';
import 'package:GsTravel/src/domain/repository/ShoppingBagRepository.dart';
import 'package:GsTravel/src/domain/repository/UsersRepository.dart';
import 'package:GsTravel/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:GsTravel/src/domain/useCase/Auth/GetUserSessionUseCase.dart';
import 'package:GsTravel/src/domain/useCase/Auth/LoginUseCase.dart';
import 'package:GsTravel/src/domain/useCase/Auth/LogoutUseCase.dart';
import 'package:GsTravel/src/domain/useCase/Auth/RegisterUseCase.dart';
import 'package:GsTravel/src/domain/useCase/Auth/SaveUserSessionUseCase.dart';
import 'package:GsTravel/src/domain/useCase/Roles/CreateRolesUseCase.dart';
import 'package:GsTravel/src/domain/useCase/Roles/GetRolesUseCases.dart';
import 'package:GsTravel/src/domain/useCase/Roles/RolesUseCases.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:GsTravel/src/domain/useCase/address/AddressUseCases.dart';
import 'package:GsTravel/src/domain/useCase/address/CreateAddressUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/DeleteAddressFromSessionUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/DeleteAddressUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/GetAddressSessionUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/GetUserAddressUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/SaveAddressInSessionUseCase.dart';
import 'package:GsTravel/src/domain/useCase/categories/CategoriesUseCases.dart';
import 'package:GsTravel/src/domain/useCase/categories/CreateCategoryUseCase.dart';
import 'package:GsTravel/src/domain/useCase/categories/DeleteCategoryUseCase.dart';
import 'package:GsTravel/src/domain/useCase/categories/GetCategoriesUseCase.dart';
import 'package:GsTravel/src/domain/useCase/categories/UpdateCategoryUseCase.dart';
import 'package:GsTravel/src/domain/useCase/products/CreateProductUseCase.dart';
import 'package:GsTravel/src/domain/useCase/products/DeleteProductUseCase.dart';
import 'package:GsTravel/src/domain/useCase/products/GetProductsByCategoryUseCase.dart';
import 'package:GsTravel/src/domain/useCase/products/ProductsUseCases.dart';
import 'package:GsTravel/src/domain/useCase/products/UpdateProductUseCase.dart';
import 'package:GsTravel/src/domain/useCase/users/UpdateUserUseCase.dart';
import 'package:GsTravel/src/domain/useCase/users/UsersUseCases.dart';
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

  // Services
  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  CategoriesService get categoriesService => CategoriesService(token);

  @injectable
  ProductsService get productsService => ProductsService(token);

  @injectable
  RolesService get rolesService => RolesService();

  @injectable
  AddressService get addressService => AddressService(token);
  // Repositories
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

  @injectable
  RolesRepository get rolesRepository => RolesRepositoryImpl(rolesService);

  @injectable
  ShoppingBagRepository get shoppingBagRepository =>
      ShoppingBagRepositoryImpl(sharedPref);

  @injectable
  AddressRepository get addressRepository =>
      AddressRepositoryImpl(addressService, sharedPref);

  // Use Cases
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
        delete: DeleteCategoryUseCase(categoriesRepository),
      );

  @injectable
  ProductsUseCases get productsUseCases => ProductsUseCases(
        create: CreateProductUseCase(productsRepository),
        getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
        update: UpdateProductUseCase(productsRepository),
        delete: DeleteProductUseCase(productsRepository),
      );

  @injectable
  RolesUseCases get rolesUseCases => RolesUseCases(
        create: CreateRolesUseCase(rolesRepository),
        getRoles: GetRolesUseCases(rolesRepository),
      );

  @injectable
  ShoppingBagUseCases get shoppingBagUseCases => ShoppingBagUseCases(
      add: AddShoppingBagUseCase(shoppingBagRepository),
      getProducts: GetProductsShoppingBagUseCase(shoppingBagRepository),
      deleteItem: DeleteItemShoppinBagUseCase(shoppingBagRepository),
      deleteShoppingBag: deleteShoppingBagUseCase(shoppingBagRepository),
      getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository));
  @injectable
  AddressUseCases get addressUseCases => AddressUseCases(
      create: CreateAddressUseCase(addressRepository),
      getUserAddress: GetUserAddressUseCase(addressRepository),
      saveAddressInSession: SaveAddressInSessionUseCase(addressRepository),
      getAddressSession: GetAddressSessionUseCase(addressRepository),
      delete: DeleteAddressUseCase(addressRepository),
      deleteFromSession: DeleteAddressFromSessionUseCase(addressRepository));
}
