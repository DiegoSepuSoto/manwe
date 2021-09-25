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

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          'posts-by-service-screen',
          arguments: id,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: kDefaultPadding),
        height: size.height * 0.17,
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
              height: size.height * 0.10,
              color: Colors.white,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: imageURL,
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
              height: size.height * 0.06,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: kDefaultPadding
                ),
                child: Container(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
