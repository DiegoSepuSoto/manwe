import 'package:flutter/material.dart';
import 'package:manwe/src/ui/posts/components/post_card.dart';
import 'package:manwe/src/ui/utils/constants.dart';


class PostsSectionPAE extends StatelessWidget {
  const PostsSectionPAE();

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
                      text: 'PAE',
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
                    title: 'Hábitos de estudio',
                    image: 'assets/images/publications/publicacion_1.jpg',
                    overview:
                        'Para terminar la semana y empezar con un buen descansar te dejamos algunos tips de hábitos de estudio',
                    postID: '1',
                  ),
                  PostCard(
                    title: '¿Quién Soy?',
                    image: 'assets/images/publications/publicacion_4.jpg',
                    overview:
                        'Al plantearnos la pregunta: ¿Quién soy yo? seguramente, una de las primeras cosas que viene a nuestra cabeza',
                    postID: '1',
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
