import 'dart:convert';
import 'package:ecommerce_v2/src/domain/models/User.dart';
import 'package:ecommerce_v2/src/domain/utils/ListToString.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_v2/src/data/api/ApiConfig.dart';
import 'package:ecommerce_v2/src/domain/models/AuthResponse.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      //  http://192.168.56.1:3000/auth/login
      Uri url = Uri.https(ApiConfig.API_ECOMMECE, '/auth/login');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode({'email': email, 'password': password});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      //  http://192.168.56.1:3000/auth/register
      Uri url = Uri.https(ApiConfig.API_ECOMMECE, '/auth/register');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(user.toJson());

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
