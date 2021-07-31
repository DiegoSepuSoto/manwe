import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class HeaderInfoButton extends StatelessWidget {
  final String serviceDetailsRoute;

  const HeaderInfoButton({required this.serviceDetailsRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, serviceDetailsRoute);
        },
        child: Icon(
          Icons.info,
          color: kTextColor,
          size: 30.0,
        ),
      ),
    );
  }
}
