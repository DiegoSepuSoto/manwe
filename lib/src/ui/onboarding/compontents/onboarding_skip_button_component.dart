import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:onboarding/onboarding.dart';

SkipButtonStyle onBoardingSkipButtonComponent() {
  return SkipButtonStyle(
    skipButtonColor: kPrimaryColor,
    skipButtonText: Text('Saltar',
      style:
      TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    )
  );
}