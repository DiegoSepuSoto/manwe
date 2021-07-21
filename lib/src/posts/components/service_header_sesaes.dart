import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class ServiceHeaderSESAES extends StatelessWidget {
  const ServiceHeaderSESAES();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Image.asset(
          'assets/images/logo_sesaes.png',
          height: size.height * 0.14,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: kDefaultPadding),
          child: Text(
            'Servicio de Salud Estudiantil',
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
