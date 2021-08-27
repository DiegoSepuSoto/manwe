import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Buscar',
        ),
      ),
    );
  }
}
