import 'package:ecommerce_v2/src/domain/useCase/Auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/LoginUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/LogoutUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/RegisterUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/SaveUserSessionUseCase.dart';

//class principal del Auth
class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUserSession;
  LogoutUseCase logout;

  AuthUseCases(
      {required this.login,
      required this.register,
      required this.saveUserSession,
      required this.getUserSession,
      required this.logout});
}
