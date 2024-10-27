import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:ecommerce_v2/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final Resource? response;
  final GlobalKey<FormState>? formKey;
  final bool showPassword; // <- Nuevo campo

  const LoginState({
    this.email = const BlocFormItem(error: 'Ingresa el email'),
    this.password = const BlocFormItem(error: 'Ingresa el password'),
    this.formKey,
    this.response,
    this.showPassword = false, // <- Valor por defecto
  });

  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    Resource? response,
    GlobalKey<FormState>? formKey,
    bool? showPassword, // <- Nuevo parámetro
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
      response: response,
      showPassword: showPassword ?? this.showPassword, // <- Aquí también
    );
  }

  @override
  List<Object?> get props => [email, password, response, showPassword];
}
