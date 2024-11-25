import 'package:GsTravel/src/domain/models/User.dart';
import 'package:GsTravel/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:GsTravel/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:GsTravel/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:GsTravel/src/presentation/utils/BlocFormItem.dart';
import 'package:GsTravel/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:GsTravel/src/presentation/widgest/DefaultTextField.dart';
import 'package:flutter/material.dart';

class ProfileUpdateContent extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  User? user;

  ProfileUpdateContent(this.bloc, this.state, this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).primaryColor, // Fondo en color primario
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Acción para retroceder
          },
        ),
      ),
      body: Form(
        key: state.formKey,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                SizedBox(height: 50), // Espacio superior
                _imageProfile(context),
                SizedBox(height: 50),
                _cardProfileInfo(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageProfile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(context, () {
          bloc?.add(ProfileUpdatePickImage());
        }, () {
          bloc?.add(ProfileUpdateTakePhoto());
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          backgroundImage: state.image != null
              ? FileImage(state.image!) as ImageProvider
              : (user != null && user!.image != null && user!.image!.isNotEmpty
                  ? NetworkImage(user!.image!)
                  : AssetImage('assets/img/user_menu.png')) as ImageProvider,
        ),
      ),
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textUpdateInfo(),
            _textFieldName(),
            _textFieldLastname(),
            _textFieldPhone(),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  bloc?.add(ProfileUpdateFormSubmit());
                },
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textUpdateInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        'ACTUALIZAR INFORMACIÓN',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: DefaultTextField(
        label: 'Nombre',
        icon: Icons.person,
        color: Colors.black,
        initialValue: user?.name ?? '',
        onChanged: (text) {
          bloc?.add(ProfileUpdateNameChanged(name: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.name.error;
        },
      ),
    );
  }

  Widget _textFieldLastname() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: DefaultTextField(
        label: 'Apellido',
        icon: Icons.person_outline,
        color: Colors.black,
        initialValue: user?.lastname ?? '',
        onChanged: (text) {
          bloc?.add(ProfileUpdateLastnameChanged(
              lastname: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.lastname.error;
        },
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: DefaultTextField(
        label: 'Teléfono',
        icon: Icons.phone,
        color: Colors.black,
        initialValue: user?.phone ?? '',
        onChanged: (text) {
          bloc?.add(
              ProfileUpdatePhoneChanged(phone: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.phone.error;
        },
      ),
    );
  }
}
