import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manwe/src/utils/constants.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MainAppBar({this.height = 190.0});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool hasTopNotch = MediaQuery.of(context).viewPadding.top > 30.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        padding: EdgeInsets.only(
            top: hasTopNotch ? size.height * 0.08 : size.height * 0.06),
        width: size.width,
        height: hasTopNotch ? 210.0 : 180.0,
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
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
                radius: 40.0,
              ),
            ),
            Text(
              'Diego Sepúlveda',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
