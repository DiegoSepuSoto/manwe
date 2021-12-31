import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:onboarding/onboarding.dart';
import 'package:manwe/src/shared/user_preferences.dart';

ProceedButtonStyle onBoardingProceedButtonStyleComponent() {
  return ProceedButtonStyle(
    proceedpButtonText: Text('Salir',
      style:
        TextStyle(
          color: Colors.white,
          fontSize: 20.0
        ),
    ),
    proceedButtonColor: kPrimaryColor,
    proceedButtonRoute: (context) async {
      await UserPreferences.setShowOnBoarding(false);
      return Navigator.pushNamedAndRemoveUntil(
          context,
          'login',
          (route) => false,
      );
    }
  );
}