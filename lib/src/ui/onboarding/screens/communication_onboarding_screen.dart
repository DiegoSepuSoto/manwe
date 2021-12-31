import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

PageModel communicationOnBoardingScreen() {
  return PageModel(
    widget: Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: Text(
              "Busca apoyo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Podrás contactar a los diferentes servicios estudiantiles en caso que necesites apoyo",
              style: TextStyle(
                fontSize: 20.0,
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Image.asset(
              "assets/images/onboarding_communication.png"
          ),
        ),
      ],
    ),
  );
}
