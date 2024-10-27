import 'package:ecommerce_v2/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/AuthService.dart';
import 'package:ecommerce_v2/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_v2/src/domain/models/User.dart';
import 'package:ecommerce_v2/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;
  SharedPref sharedPref;

  AuthRepositoryImpl(this.authService, this.sharedPref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read('user');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPref.save('user', authResponse.toJson());
  }

  @override
  Future<bool?> logout() async {
    return await sharedPref.remove('user');
  }
}
