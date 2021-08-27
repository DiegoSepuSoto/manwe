import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class ServiceCard extends StatelessWidget {
  final String id;
  final String name;
  final String imageURL;

  const ServiceCard(
      {required this.id, required this.name, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding),
      height: size.height * 0.29,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.65,
            height: size.height * 0.20,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            width: size.width * 0.65,
            height: size.height * 0.08,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}