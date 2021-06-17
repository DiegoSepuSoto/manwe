import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class PostCategory extends StatelessWidget {
  final String category;

  const PostCategory({this.category = 'Autocuidado'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(
        left: kDefaultPadding,
      ),
      color: kPrimaryColor,
      child: Text(
        category,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
