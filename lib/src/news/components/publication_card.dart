import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class PublicationCard extends StatelessWidget {
  final String image;
  final String title;

  const PublicationCard({
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'news-details');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            width: size.width * 0.3,
            height: size.height * 0.27,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black),
              ),
            ),
            padding: EdgeInsets.all(5.0),
            width: size.width * 0.3,
            height: 35.0,
            child: Container(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
