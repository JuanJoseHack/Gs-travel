import 'package:GsTravel/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:GsTravel/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:GsTravel/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:GsTravel/src/presentation/utils/BlocFormItem.dart';
import 'package:GsTravel/src/presentation/widgest/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterContent extends StatelessWidget {
  final RegisterBloc? bloc;
  final RegisterState state;

  RegisterContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buttonGoToLogin(context),
          _buildBackgroundImage(context),
          _buildLogo(),
          _buildFormContainerWithButton(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
          ],
          stops: [0.5, 1.0],
        ).createShader(rect);
      },
      blendMode: BlendMode.darken,
      child: Image.asset(
        'assets/background1.jpg',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 50,
      child: Image.asset(
        'assets/logogs.png',
        height: 90,
      ),
    );
  }

  Widget _buildFormContainerWithButton(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.75,
          margin: EdgeInsets.only(
              top: 175, left: 30), // Mueve el contenedor a la derecha
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 110), // Espacio para el botón
                Text(
                  'Bienvenido a GS Travel',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                _buildTextField(
                  label: 'NOMBRE',
                  onChanged: (text) => bloc?.add(
                      RegisterNameChanged(name: BlocFormItem(value: text))),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  label: 'APELLIDO',
                  onChanged: (text) => bloc?.add(RegisterLastnameChanged(
                      lastname: BlocFormItem(value: text))),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  label: 'CORREO ELECTRONICO',
                  onChanged: (text) => bloc?.add(
                      RegisterEmailChanged(email: BlocFormItem(value: text))),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  label: 'TELÉFONO',
                  onChanged: (text) => bloc?.add(
                      RegisterPhoneChanged(phone: BlocFormItem(value: text))),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  label: 'CONTRASEÑA',
                  obscureText: true,
                  onChanged: (text) => bloc?.add(RegisterPasswordChanged(
                      password: BlocFormItem(value: text))),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  label: 'CONFIRMAR CONTRASEÑA',
                  obscureText: true,
                  onChanged: (text) => bloc?.add(RegisterConfirmPasswordChanged(
                      confirmPassword: BlocFormItem(value: text))),
                ),
                SizedBox(height: 20),
                _buildRegisterButton(context),
              ],
            ),
          ),
        ),
        _buttonGoToLogin(context), // Añadir el botón de "Ingresar"
      ],
    );
  }

  Widget _buttonGoToLogin(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 45,
        margin:
            EdgeInsets.only(top: 207, right: 31), // Ajusta el margen derecho
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Cierra la pantalla actualavegar a login
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 83, 139, 63),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
          child: Text(
            'Ingresar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    bool obscureText = false,
  }) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 45),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 83, 139, 63),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: obscureText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 10,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildRegisterButton(context) {
    return Container(
      margin: EdgeInsets.only(left: 60, right: 60, top: 0, bottom: 15),
      height: 50,
      child: DefaultButton(
        text: 'REGISTRARSE',
        color: const Color.fromARGB(255, 215, 51, 51),
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(RegisterFormSubmit());
            Navigator.pop(context);
          } else {
            Fluttertoast.showToast(
              msg: 'El formulario no es valido',
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
      ),
    );
  }
}
