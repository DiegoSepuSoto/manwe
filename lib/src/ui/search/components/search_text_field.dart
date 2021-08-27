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
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0
        ),
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: kPrimaryColor,),
          labelText: 'Buscar',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          helperText: 'Busca el contenido que desees en las publicaciones',
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
