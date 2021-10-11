import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/user.dart';
import 'package:manwe/src/shared/user_preferences.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User userInfo = UserPreferences.getUserInfo();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Tu Perfil",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: kDefaultPadding * 2,
          right: kDefaultPadding * 2,
          top: kDefaultPadding * 2,
          bottom: kDefaultPadding * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 56,
              backgroundColor: kPrimaryColor,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
                radius: 50,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileTextTitle("Tu nombre:"),
                  ProfileText(userInfo.fullName),
                  SizedBox(height: 15.0),
                  ProfileTextTitle("Tu correo:"),
                  ProfileText(userInfo.email),
                  SizedBox(height: 15.0),
                  ProfileTextTitle("Tu carrera:"),
                  ProfileText(userInfo.career),
                ],
              ),
            ),
            Spacer(),
            ProfileTextTitle("Versión de la app:"),
            SizedBox(height: 15.0),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}

class ProfileTextTitle extends StatelessWidget {
  final String text;

  ProfileTextTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  final String text;

  ProfileText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 17.0),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(primary: Colors.redAccent),
      icon: Icon(
        Icons.logout,
        size: 30.0,
      ),
      onPressed: () {
        UserPreferences.deleteUserInfo();
        Navigator.pushNamedAndRemoveUntil(context, "login", (Route<dynamic> route) => false);
      },
      label: Padding(
        padding: EdgeInsets.only(
          top: 7.0,
          bottom: 7.0,
        ),
        child: Text(
          "Cerrar Sesión",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
    // return Text("Cerrar Sesión");
  }
}
