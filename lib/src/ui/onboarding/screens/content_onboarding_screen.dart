import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

PageModel contentOnBoardingScreen() {
  return PageModel(
    widget: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
          child: Image.asset(
            "assets/images/onboarding_content.png"
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Infórmate",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Con las publicaciones y notificaciones de los servicios estudiantiles de la universidad podrás conocer información relevante sobre tu formación extraacadémica",
              style: TextStyle(
                fontSize: 20.0,
              ),
            )
        )
      ],
    ),
  );
}
