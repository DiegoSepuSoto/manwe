import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class HeaderInfoButton extends StatelessWidget {
  const HeaderInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'service-details');
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
