import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class CategoryItem extends StatelessWidget {
  final String title;

  const CategoryItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: kDefaultPadding,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0
        ),
      ),
    );
  }
}
