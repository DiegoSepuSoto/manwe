import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class ServiceHeaderPAE extends StatelessWidget {
  const ServiceHeaderPAE();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Image.asset(
          'assets/images/logo_pae.png',
          height: size.height * 0.14,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: kDefaultPadding),
          child: Text(
            'Plan de Apoyo Estudiantil',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: kPrimaryColor,
              fontSize: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}