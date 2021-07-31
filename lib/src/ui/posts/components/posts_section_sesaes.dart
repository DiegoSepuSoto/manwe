import 'package:flutter/material.dart';
import 'package:manwe/src/ui/posts/components/post_card.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class PostsSectionSESAES extends StatelessWidget {
  const PostsSectionSESAES();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.only(
        bottom: kDefaultPadding,
      ),
      child: Column(
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
                      color: kTextColor, fontFamily: 'Nunito', fontSize: 18.0),
                  children: [
                    TextSpan(text: 'Últimas publicaciones de '),
                    TextSpan(
                      text: 'SESAES',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                top: kDefaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PostCard(
                    title: 'Alimentos Ácidos',
                    image: 'assets/images/publications/publicacion_5.jpg',
                    overview:
                        '¿Sabias que los alimentos acidos pueden dañar tus dientes?.',
                    detailRoute: 'alimentos-acidos',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
