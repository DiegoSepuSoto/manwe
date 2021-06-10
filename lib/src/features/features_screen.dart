import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'feature-details');
            },
            child: Container(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kDefaultPadding * 2,
              ),
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/images/pomodoro.jpg'),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                      'Técnica Pomodoro',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
