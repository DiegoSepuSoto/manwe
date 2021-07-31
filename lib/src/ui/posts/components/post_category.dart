import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class PostCategory extends StatelessWidget {
  final String category;

  const PostCategory({this.category = 'Autocuidado'});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(5.0)
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
      margin: EdgeInsets.only(
        left: kDefaultPadding,
      ),
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
