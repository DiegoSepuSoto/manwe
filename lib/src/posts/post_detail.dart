import 'package:flutter/material.dart';
import 'package:manwe/src/posts/components/header_back_button.dart';
import 'package:manwe/src/posts/components/post_categories.dart';
import 'package:manwe/src/posts/components/service_header.dart';
import 'package:manwe/src/utils/constants.dart';

class PostDetail extends StatelessWidget {
  const PostDetail();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderBackButton(),
                ServiceHeader(),
                PostCategories(),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    'Hábitos de Estudio',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    'Organiza tu tiempo!',
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
                    'Lograr una buena planificación y organización del tiempo es fundamental para mantener un equilibrio entre los diversos ámbitos que forman parte del desarrollo personal (estudio, tiempo libre, descanso, etc.). Es vital continuar realizando hobbies, deporte, destinar las horas necesarias para elsieño y descanso, compartir y socializar con otras personas, así como mantener una buena aimentación.',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    'Distribuye las materias!',
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
                    'Es erróneo pensar que se requiere dedicar el mismo tiempo de estudio para todas las asignaturas. Es importante reconoceer qué materias son más difíciles y necesitamos dedicarles más tiempo . También se recomienda que las asignaturas parecidas no se estudien seguidas.',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    'Practica!',
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
                    'La única forma de recordad e integrar los nuevos aprendizajes es mantenerlos de forma permanente. Invertir tiempo en revisar los contenidos nuevos después de la clase, repasar y asimilar la información, complementar alguna idea con material bibliográfico extra.',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    'Si hay dudas, pregunta!',
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
                    'Dedica tiempo para revisar las materias antes de la clase, esto te permite revisar y confirmar la comprensión de la información recogida e identificar las dudas para clarificarlas en la clase siguiente.',
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
    );
  }
}
