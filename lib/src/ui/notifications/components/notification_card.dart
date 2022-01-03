import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:manwe/src/ui/utils/functions.dart';

class NotificationCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final String body;

  const NotificationCard({
    required this.imageURL,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(bottom: 2.0),
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundColor: kPrimaryColor,
              backgroundImage: NetworkImage(imageURL),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              width: 3 * size.width / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(height: 5.0),
                  MarkdownBody(
                    data: body,
                    styleSheet: buildNotificationMarkdownBody(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
