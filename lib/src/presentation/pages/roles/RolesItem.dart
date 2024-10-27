import 'package:ecommerce_v2/src/domain/models/Roles.dart';
import 'package:flutter/material.dart';

class RolesItem extends StatelessWidget {
  Roles role;
  RolesItem(this.role);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, role.route, (route) => false);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 15),
            height: 100,
            child: FadeInImage(
              image: NetworkImage(role.image), //imagen de la base de datos
              fit: BoxFit.contain,
              fadeInDuration: Duration(seconds: 1),
              placeholder:
                  AssetImage('assets/img/no-image.png'), //imagen por default
            ),
          ),
          Text(
            role.name,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
