import 'package:flutter/material.dart';
import 'package:manwe/src/ui/login/components/login_form.dart';
import 'package:manwe/src/ui/login/components/login_header.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:flutter/services.dart';

class NoGlowingOverscroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowingOverscroll(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        child: Container(
          color: kPrimaryColor,
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Column(
                    children: [
                      UTEMLogo(),
                      LoginHeader(),
                      LoginForm(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: kDefaultPadding * 2),
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: size.width * 0.5,
        ),
      ),
    );
  }
}

class UTEMLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding * 2),
      child: Center(
        child: Image.asset(
          "assets/images/marca-utem-horizontal.png",
          width: size.width * 0.8,
        ),
      ),
    );
  }
}
