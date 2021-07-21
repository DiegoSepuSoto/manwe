import 'package:flutter/material.dart';
import 'package:manwe/src/shared/service_details/components/social_media_section_pae.dart';
import 'package:manwe/src/shared/service_details/components/social_media_section_sesaes.dart';
import 'package:manwe/src/utils/constants.dart';

class ServiceDetailsScreenSESAES extends StatelessWidget {
  const ServiceDetailsScreenSESAES();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: kDefaultPadding),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kTextColor,
                      size: 26.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo_sesaes.png',
                    width: 200.0,
                    height: 170.0,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    'Servicio de salud estudiantil',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                      fontSize: 27.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    top: kDefaultPadding,
                  ),
                  child: Text(
                    '¿Qué es el SESAES?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kTextColor,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    top: kDefaultPadding,
                  ),
                  child: Text(
                    'El Servicio de Salud Estudiantil (SESAES), Dependiente de la Dirección de Asuntos Estudiantiles de la Vicerrectoría Académica, está destinado a atender de forma gratuita a los alumnos de la Universidad en cualquiera de las especialidades con las que el servicio cuenta. Estas son:',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    top: kDefaultPadding,
                  ),
                  child: Text(
                    '\u2022 Odontología\n\u2022 Medicina General\n\u2022 Medicina Interna\n\u2022 Neurología\n\u2022 Traumetología\n\u2022 Kinesiología\n\u2022 Psicología\n\u2022 Enfermería\n\u2022 Matrona\n\u2022 Nutricionista',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    top: kDefaultPadding,
                  ),
                  child: Text(
                    'De esta forma, la Universidad busca disminuir las posibilidades de fracaso académico por razones de salud y, además, contribuir a mejorar la calidad de vida de la comunidad universitaria.',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                SocialMediaSectionSESAES(),
                SizedBox(
                  height: kDefaultPadding * 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
