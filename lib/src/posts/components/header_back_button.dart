import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class HeaderBackButton extends StatelessWidget {
  const HeaderBackButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: kTextColor,
          size: 26.0,
        ),
      ),
    );
  }
}
