import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class ServiceHeader extends StatelessWidget {
  const ServiceHeader();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'service-details');
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo_pae.png'),
            radius: 60.0,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: kDefaultPadding),
            child: Text(
              'Plan de Apoyo Estudiantil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}