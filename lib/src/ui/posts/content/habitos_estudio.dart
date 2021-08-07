import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manwe/src/ui/posts/components/header_back_button.dart';
import 'package:manwe/src/ui/posts/components/header_info_button.dart';
import 'package:manwe/src/ui/posts/components/post_categories.dart';
import 'package:manwe/src/ui/posts/components/service_header_pae.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class HabitosEstudio extends StatelessWidget {
  const HabitosEstudio();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor
    ));
    return Container(
      color: kBackgroundColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeader(),
                  PostCategories(
                    categories: [],
                  ),
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
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DetailScreen();
                }));
              },
              child: Container(
                height: 270.0,
                width: size.width,
                child: Image.network(
                  "http://10.0.2.2:1337/uploads/small_publicacion_1_f93522d5fc.jpg?15160.30000000028",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * 3),
                child: HeaderButtons()
            ),
          ],
        ),
        ServiceHeaderPAE(),
      ],
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

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            "http://10.0.2.2:1337/uploads/small_publicacion_1_f93522d5fc.jpg?15160.30000000028",
          ),
        ),
      ),
    );
  }
}