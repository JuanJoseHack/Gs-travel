import 'package:GsTravel/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:GsTravel/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:GsTravel/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:GsTravel/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginContent extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;

  LoginContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context), // El fondo

          // Logo colocado encima de todo
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.09, // Ajusta la altura del logo
            child: Image.asset(
              'assets/logogs.png', // Ruta de tu logo
              width: 200, // Ajusta el tamaño del logo
              height: 100,
            ),
          ),

          // Container que contiene el formulario y los botones
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.33, // Ajusta la posición del Container aquí
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Sigue centrando el contenido dentro del Container
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buttonGoToRegister(context),
                  _textLogin(),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  _buttonLogin(context),
                  _textDontHaveAccount(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textLogin() {
    return Column(
      children: [
        Text(
          'Bienvenido a GS Travel',
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
            height: 20), // Agrega un espacio de 20 píxeles debajo del texto
      ],
    );
  }

  Widget _buttonGoToRegister(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // Alinea el botón a la derecha
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.30, // Ajusta el ancho si es necesario
        height: 40,
        margin: EdgeInsets.only(top: 0, bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 83, 139, 63),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    20), // Bordes redondeados en la parte superior izquierda
                bottomLeft: Radius.circular(
                    20), // Bordes redondeados en la parte inferior izquierda
                topRight: Radius.circular(
                    0), // Sin redondeo en la parte superior derecha
                bottomRight: Radius.circular(
                    0), // Sin redondeo en la parte inferior derecha
              ),
            ),
          ),
          child: Text(
            'REGISTRATE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // HORIZANTAL
      children: [
        Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 14,
            decoration: TextDecoration.underline, // Agrega subrayado aquí
          ),
        ),
      ],
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.only(left: 40, right: 40, top: 25, bottom: 15),
        child: ElevatedButton(
          onPressed: () {
            if (state.formKey!.currentState!.validate()) {
              bloc?.add(LoginSubmit());
            } else {
              Fluttertoast.showToast(
                  msg: 'El formulario no es valido',
                  toastLength: Toast.LENGTH_LONG);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 215, 51, 51)),
          child: Text(
            'INICIAR SESION',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ));
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 83, 139, 63), // Color verde oscuro similar
        borderRadius: BorderRadius.circular(30), // Bordes redondeados
      ),
      child: TextField(
        obscureText: true, // Para ocultar la contraseña
        textAlign: TextAlign.center, // Centrar el texto
        decoration: InputDecoration(
          labelText: 'CONTRASEÑA',
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 9,
          ), // Color del texto
          border: InputBorder.none, // Sin borde
        ),
        onChanged: (text) {
          bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
        },
      ),
    );
  }

  Widget _textFieldEmail() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
          decoration: BoxDecoration(
            color: Color.fromARGB(
                255, 83, 139, 63), // Color verde similar al de la contraseña
            borderRadius: BorderRadius.circular(30), // Bordes redondeados
          ),
          child: TextField(
            keyboardType:
                TextInputType.emailAddress, // Tipo de teclado de email
            textAlign: TextAlign.center, // Centrar el texto del campo
            decoration: InputDecoration(
              labelText: 'CORREO ELECTRONICO',
              labelStyle: TextStyle(
                color: Colors.white, // Color del texto
                fontSize: 9, // Aquí puedes cambiar el tamaño del texto
              ),
              border: InputBorder.none, // Sin borde
            ),
            onChanged: (text) {
              bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
            },
          ),
        ),
        SizedBox(
          height: 20, // Espacio de 20 píxeles entre este widget y el siguiente
        ),
      ],
    );
  }

  Widget _imageBackground(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.5),
          ],
          stops: [0.5, 1.0],
        ).createShader(rect);
      },
      blendMode: BlendMode.darken,
      child: Image.asset(
        'assets/background1.jpg',
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
