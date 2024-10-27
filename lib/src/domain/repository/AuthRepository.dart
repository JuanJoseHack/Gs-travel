import 'package:ecommerce_v2/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_v2/src/domain/models/User.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<AuthResponse?> getUserSession();
  Future<bool?> logout();
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
  Future<void> saveUserSession(AuthResponse authResponse);
}
