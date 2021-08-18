import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class HeaderBackButton extends StatelessWidget {
  const HeaderBackButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding),
      child: CircleAvatar(
        backgroundColor: kPrimaryColor,
        radius: 25.0,
        child: IconButton(
          color: Colors.white,
          alignment: Alignment.centerRight,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}