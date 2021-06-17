import 'package:flutter/material.dart';
import 'package:manwe/src/posts/components/post_card.dart';
import 'package:manwe/src/utils/constants.dart';

class PostsSection extends StatelessWidget {
  const PostsSection();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
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
                      text: 'autocuidado',
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
                  ),
                  PostCard(
                    title: 'Concurso Día del Libro',
                    image: 'assets/images/publications/publicacion_2.jpg',
                    overview:
                        'TENEMOS CONCURSO PARA CELEBRAR EL DÍA DEL LIBRO 😬📚🎊🎉',
                  ),
                  PostCard(
                    title: 'Felíz día Mamá',
                    image: 'assets/images/publications/publicacion_3.jpg',
                    overview:
                        'Un afectuoso saludo a las mamás que conforman la comunidad UTEM, sabemos que durante este periodo esta labor ha sido más compleja que nunca',
                  ),
                  PostCard(
                    title: '¿Quién Soy?',
                    image: 'assets/images/publications/publicacion_4.jpg',
                    overview:
                        'Al plantearnos la pregunta: ¿Quién soy yo? seguramente, una de las primeras cosas que viene a nuestra cabeza...',
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
