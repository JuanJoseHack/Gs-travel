import 'package:ecommerce_v2/src/domain/models/Roles.dart';
import 'package:ecommerce_v2/src/presentation/pages/roles/RolesItem.dart';
import 'package:ecommerce_v2/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/roles/bloc/RolesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RolesBloc, RolesState>(builder: (context, state) {
      // Verifica si los roles están cargados
      if (state.roles != null) {
        if (state.roles!.length == 1) {
          // Si el usuario tiene solo un rol
          final role = state.roles!.first;
          if (role?.id == 'CLIENT') {
            // Si el único rol es 'CLIENTE', redirigir al HomePage
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, 'roles');
            });
            return Container(); // Evita mostrar cualquier UI mientras se redirige
          }
        }
      } 
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: state.roles != null
              ? (state.roles?.map((Roles? role) {
                  return role != null ? RolesItem(role) : Container();
                }).toList()) as List<Widget>
              : [],
        ),
      );
    }));
  }
}
