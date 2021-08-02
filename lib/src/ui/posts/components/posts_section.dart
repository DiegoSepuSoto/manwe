import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/home_page.dart';
import 'package:manwe/src/ui/posts/components/post_card.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class PostsSection extends StatelessWidget {
  final String serviceNameAbbreviation;
  final List<PostForPreview> postsForPreview;

  const PostsSection(
      {required this.serviceNameAbbreviation, required this.postsForPreview});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.only(
        bottom: kDefaultPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              top: kDefaultPadding,
            ),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Nunito',
                    fontSize: 18.0,
                  ),
                  children: [
                    TextSpan(text: 'Últimas publicaciones de '),
                    TextSpan(
                      text: serviceNameAbbreviation,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            height: size.height > 750 ? size.height * 0.48 : size.height * 0.49,
            child: Padding(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                top: kDefaultPadding,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: postsForPreview.length,
                  itemBuilder: (context, index) {
                    return PostCard(
                      title: postsForPreview[index].title,
                      image: postsForPreview[index].imageUrl,
                      overview: postsForPreview[index].summary,
                      detailRoute: 'habitos-estudio',
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
