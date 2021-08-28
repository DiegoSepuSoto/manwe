import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class PostListItem extends StatelessWidget {
  final String id;
  final String imageURL;
  final String title;
  final String summary;

  const PostListItem({
    required this.id,
    required this.imageURL,
    required this.title,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          'post-page',
          arguments: id,
        );
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Row(
            children: [
              PostImage(
                imageURL: imageURL,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostTitle(
                        title: title,
                      ),
                      PostSummary(summary: summary)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  final String imageURL;

  const PostImage({required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kDefaultPadding),
      child: CircleAvatar(
        backgroundColor: kPrimaryColor,
        radius: 45.0,
        child: CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage(imageURL),
        ),
      ),
    );
  }
}

class PostTitle extends StatelessWidget {
  final String title;

  const PostTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PostSummary extends StatelessWidget {
  final String summary;

  const PostSummary({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Text(
      summary,
      maxLines: 4,
      style: TextStyle(
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
