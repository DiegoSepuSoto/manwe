import 'package:flutter/material.dart';
import 'package:manwe/src/shared/service_details/components/social_media_section_pae.dart';
import 'package:manwe/src/utils/constants.dart';

class ServiceDetailsScreenPAE extends StatelessWidget {
  const ServiceDetailsScreenPAE();

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
                      'assets/images/logo_pae.png',
                      width: 200.0,
                      height: 170.0,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: kDefaultPadding),
                    child: Text(
                      'Plan de Apoyo Estudiantil',
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
                      '¿Qué es el plan de apoyo estudiantil?',
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
                      'Es un programa de acompañamiento que se aboca a la atención personalizada de estudiantes de primer año, con el objetivo de promover su desarrollo integral y apoyar la inserción a la vida universitaria y a la carrera.',
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
                      'Abarca tres áreas de trabajo, las cuales son aspectos críticos que inciden en la deserción de los y las estudiantes: Estrategias de aprendizaje, análisis vocacional y, salud física y emocional, las cuales facilitan la inserción institucional y social, junto con aportar al desarrollo de una mayor competitividad del estudiantado.',
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
                      '¿Qué es un tutor o tutora PAE?',
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
                      'Un tutor o tutora es la persona que, mediante la acción individualizada, acompaña a un grupo de estudiantes a su cargo. Ellos y ellas Intercambia información, experiencias y apoyo que retroalimentan el trabajo individual y colectivo con los tutorados y tutoradas.',
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
                      '¿Qué significa ser tutorado o tutorada PAE?',
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
                      'Ser tutorado o tutorada PAE significa que se cuenta con acompañamiento profesional y tutorial psicosocial durante el primer año de carrera.',
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
                      'Apoyo Tutorial',
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
                      '\u2022 Grupos de estudio de ramos críticos\n\u2022 Préstamo de material como guías de trabajo, apuntes, u otros.\n\u2022 Orientación sobre estrategias de estudio\n\u2022 Estrategias para la gestión del tiempo de estudio\n\u2022 Información sobre ramos y profesores\n\u2022 Información sobre servicios de apoyo UTEM\n\u2022 Orientación sobre la carrera\n\u2022 Apoyo en la toma de ramos del 2do semestre\n\u2022 Actividades sociorecreativas\n\u2022 Otras actividades universitarias',
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
                      'Comunícate con nosotros!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kTextColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SocialMediaSectionPAE(),
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
