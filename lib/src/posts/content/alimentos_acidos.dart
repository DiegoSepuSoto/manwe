import 'package:flutter/material.dart';
import 'package:manwe/src/posts/components/header_back_button.dart';
import 'package:manwe/src/posts/components/header_info_button.dart';
import 'package:manwe/src/posts/components/post_categories.dart';
import 'package:manwe/src/posts/components/service_header_pae.dart';
import 'package:manwe/src/posts/components/service_header_sesaes.dart';
import 'package:manwe/src/utils/constants.dart';

class AlimentosAcidos extends StatelessWidget {
  const AlimentosAcidos();

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
                  ServiceHeaderSESAES(),
                  PostCategories(
                    categories: ['Salud física', 'Salud dental', 'Alimentación'],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: kDefaultPadding),
                    child: Text(
                      'Alimentos Ácidos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    child: Text(
                      '¿Sabías que los alimentos ácidos pueden dañar tus dientes?',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      top: 10.0,
                    ),
                    child: Text(
                      'El consumo constante de alimentos ácidos puede llegar a desgastar los dientes, dejando la dentina o segunda capa del diente expuesta, esto tiene consecuencias directas en tu salud bucal.',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    child: Text(
                      'Efectos de los ácidos sobre los dientes:',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      top: 10.0,
                    ),
                    child: Text(
                      '1) Erosion dental: Desgaste del esmalte exponiendo la dentina',
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
                      '2) Pérdida de la tonalidad: Los dientes al estar desgastados tienden a verse más oscuros o amarillentos.',
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
                      '3) Sensibilidad: Dolor o sensibilidad principalmente ante cambios de temperatura',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    child: Text(
                      'Debes controlar el consumo:',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      top: 10.0,
                    ),
                    child: Text(
                      'Alimentos cítricos: Principalmente frutas con alto contenido ácido como limón y naranja.',
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
                      'Bebidas gaseosas carbonatadas: Bebidas gasificadas cola comúnmente son las más ácidas',
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
                      'Alimentos enlatados de alto contenido cítrico para su conservación',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
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
          serviceDetailsRoute: 'service-details-sesaes',
        ),
      ],
    );
  }
}
