import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class PostCard extends StatelessWidget {
  final String image;
  final String title;
  final String overview;

  const PostCard({
    required this.image,
    required this.title,
    required this.overview
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'post-details');
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 4.0
        ),
        margin: EdgeInsets.only(
          right: kDefaultPadding
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.65,
              height: size.height * 0.2,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              width: size.width * 0.65,
              height: size.height * 0.25,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Text(
                        overview,
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                        maxLines: size.height > 750 ? 5 : 4,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
