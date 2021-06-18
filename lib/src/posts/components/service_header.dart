import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class ServiceHeader extends StatelessWidget {
  const ServiceHeader();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'service-details');
      },
      child: Column(
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
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
