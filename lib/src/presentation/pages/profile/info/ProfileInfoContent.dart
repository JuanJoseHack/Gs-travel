import 'package:ecommerce_v2/src/domain/models/User.dart';
import 'package:flutter/material.dart';

class ProfileInfoContent extends StatelessWidget {
  User? user;

  ProfileInfoContent(this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        Column(
          children: [
            _imageProfile(),
            SizedBox(height: 60), // Espacio entre la imagen de perfil y el card
            Expanded(child: _cardProfileInfo(context)),
          ],
        ),
      ],
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.35,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.69),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          // Usamos un Stack para el botón de edición
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 30), // Espacio adicional antes de los ListTile
                  ListTile(
                    title: Text('${user?.name ?? ''} ${user?.lastname ?? ''}'),
                    subtitle: Text('Nombre de usuario'),
                    leading: Icon(Icons.person),
                  ),
                  ListTile(
                    title: Text(user?.email ?? ''),
                    subtitle: Text('Correo electronico'),
                    leading: Icon(Icons.email),
                  ),
                  ListTile(
                    title: Text(user?.phone ?? ''),
                    subtitle: Text('Telefono'),
                    leading: Icon(Icons.phone),
                  ),
                ],
              ),
            ),
            Positioned(
              // Posicionamos el botón de edición
              right: 5,
              bottom: 20, // Ajusta este valor para mover el botón hacia arriba
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, 'profile/update',
                      arguments: user);
                },
                child: Icon(
                  Icons.edit,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/background1.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.267),
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _imageProfile() {
    return Container(
      margin: EdgeInsets.only(top: 80),
      width: 200,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipOval(
          child: user != null && user!.image != null && user!.image!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user_image.png',
                  image: user!.image!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                )
              : Image.asset('assets/img/user_image.png'), // Imagen por defecto
        ),
      ),
    );
  }
}
