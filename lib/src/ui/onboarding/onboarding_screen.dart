import 'package:flutter/material.dart';
import 'package:manwe/src/ui/onboarding/compontents/onboarding_indicator_component.dart';
import 'package:manwe/src/ui/onboarding/compontents/onboarding_proceed_button_component.dart';
import 'package:manwe/src/ui/onboarding/compontents/onboarding_skip_button_component.dart';
import 'package:manwe/src/ui/onboarding/screens/communication_onboarding_screen.dart';
import 'package:manwe/src/ui/onboarding/screens/content_onboarding_screen.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen();

  static final onBoardingPagesList = [
    contentOnBoardingScreen(),
    communicationOnBoardingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      background: kBackgroundColor,
        skipButtonStyle: onBoardingSkipButtonComponent(),
        pages: onBoardingPagesList,
        indicator: onBoardingIndicatorComponent(),
        proceedButtonStyle: onBoardingProceedButtonStyleComponent(),
    );
  }
}
