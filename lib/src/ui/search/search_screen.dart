import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height - 300.0,
          child: Center(
            child: Text(
              'Pronto...',
              style: TextStyle(
                  fontSize: 25.0,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
        )
      ],
    );
  }
}
