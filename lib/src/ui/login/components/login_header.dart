import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopText(),
          BottomText(),
        ],
      ),
    );
  }
}

class TopText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Text(
        "App Kümelen",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 42.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Text(
        "Plataforma de apoyo extraacadémico",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 19.0,
        ),
      ),
    );
  }
}
