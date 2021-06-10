import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: Container(
      margin: EdgeInsets.only(left: kDefaultPadding),
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/profile.png"),
      ),
    ),
    title: Text(
      "Kümelen",
      style: TextStyle(
        fontFamily: "Nunito",
        fontWeight: FontWeight.bold
      ),
    ),
    elevation: 0,
  );
}
