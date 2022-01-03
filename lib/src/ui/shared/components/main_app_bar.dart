import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manwe/src/shared/user_preferences.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MainAppBar({this.height = 190.0});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: size.height * 0.05,
        ),
        width: size.width,
        height: size.height > 750.0 ? size.height * 0.22 : size.height * 0.25,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.37, 0.95],
            colors: [
              kPrimaryColor,
              kSecondaryColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "profile");
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: CircleAvatar(
                  radius: size.height > 600.0 ? 38 : 26,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                    radius: size.height > 600.0 ? 34 : 22,
                  ),
                ),
              ),
              Text(
                getHeaderName(),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Ver Perfil",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  String getHeaderName() {
    return "¡Hola, ${UserPreferences.getUserFirstName()}!";
  }
}
