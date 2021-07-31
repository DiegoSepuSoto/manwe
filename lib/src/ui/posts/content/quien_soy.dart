import 'package:flutter/material.dart';
import 'package:manwe/src/ui/posts/components/header_back_button.dart';
import 'package:manwe/src/ui/posts/components/header_info_button.dart';
import 'package:manwe/src/ui/posts/components/post_categories.dart';
import 'package:manwe/src/ui/posts/components/service_header_pae.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class QuienSoy extends StatelessWidget {
  const QuienSoy();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderButtons(),
                  ServiceHeaderPAE(),
                  PostCategories(
                    categories: [
                      'Autodescubrimiento',
                      'Autoestima',
                      'Motivación'
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: kDefaultPadding),
                    child: Text(
                      '¿Quién Soy?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      top: 10.0,
                    ),
                    child: Text(
                      'Al plantearnos la pregunta: ¿Quién soy yo? seguramente, una de las primeras cosas que viene a nuestra cabeza son una serie de categorías que valoramos en mayor o menor medida. Estas dicen relación con el autoconcepto y la autoestima, es decir, cómo nos vemos a nosotros/as/es mismos/as/es lo que comparamos con los ideales que otros/as/es tienen de nosotros/as/es, ya sea dentro de nuestra familia o en la sociedad.',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      top: 10.0,
                    ),
                    child: Text(
                      'De alguna manera, evaluamos el cómo decimos que somos con el cómo, se supone, deberíamos ser, entonces si tenemos características que son bien consideradas dentro de nuestra sociedad, como lo podrían ser ciertas rasgos físicos o tener la capacidad de consumir determinadas marcas, probablemente nos sentiremos satisfechos y no tendremos miedo de expresarnos ni de hacer alusión a quienes somos. Sin embargo, ocurre que no todes cumplimos con estos ideales y, en ocasiones, se constituyen en una fuente de frustración y sufrimiento para las personas.',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      top: 10.0,
                    ),
                    child: Text(
                      'Recuerda que la identidad es un derecho y no es necesario cumplir con expectativas que nos dañen o que dañen a otras personas. Rodéate de gente que pueda reconocer tu potencial y tú, también, intenta verlo y apreciarlo (está ahí, sin duda). Es importante que le demos valor a la diversidad, en un sentido amplio, ya que enriquece nuestra experiencia y, entre muchas otras cosas, da lugar a formas de vida más creativas. Los ideales no son jaulas.',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding * 3,
                      right: kDefaultPadding * 3,
                      top: 10.0,
                    ),
                    child: Image.asset(
                        'assets/images/publications/publicacion_4.jpg'),
                  ),
                  SizedBox(
                    height: kDefaultPadding * 2,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderButtons extends StatelessWidget {
  const HeaderButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderBackButton(),
        Spacer(),
        HeaderInfoButton(
          serviceDetailsRoute: 'service-details-pae',
        ),
      ],
    );
  }
}
