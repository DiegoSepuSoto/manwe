import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const FeatureCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'feature-details');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: kTextColor.withOpacity(0.5),
              blurRadius: 3,
              offset: Offset(3, 3),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          bottom: 5.0,
        ),
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding * 2,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
              alignment: Alignment.center,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                color: kPrimaryColor,
              ),
              child: Text(
                title,
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
    );
  }
}
