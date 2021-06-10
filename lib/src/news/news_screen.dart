import 'package:flutter/material.dart';
import 'package:manwe/src/news/components/publication_card.dart';
import 'package:manwe/src/utils/constants.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
          child: Text(
            "Últimas Publicaciones",
            style: TextStyle(fontSize: 25.0),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding:
                EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
            child: Row(
              children: [
                PublicationCard(
                  title: "Hábitos de estudio",
                  image: "assets/images/publications/publicacion_1.jpg",
                ),
                PublicationCard(
                  title: "Concurso día del libro",
                  image: "assets/images/publications/publicacion_2.jpg",
                ),
                PublicationCard(
                  title: "Feliz día Mamá",
                  image: "assets/images/publications/publicacion_3.jpg",
                ),
                PublicationCard(
                  title: "¿Quién soy yo?",
                  image: "assets/images/publications/publicacion_4.jpg",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
