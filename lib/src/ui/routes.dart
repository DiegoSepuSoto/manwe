import 'package:flutter/material.dart';
import 'package:manwe/src/ui/posts/content/alimentos_acidos.dart';
import 'package:manwe/src/ui/posts/content/habitos_estudio.dart';
import 'package:manwe/src/ui/posts/content/quien_soy.dart';
import 'package:manwe/src/ui/shared/service_details/service_details_screen_pae.dart';
import 'package:manwe/src/ui/shared/service_details/service_details_screen_sesaes.dart';

import 'features/feature_details.dart';
import 'features/features_screens/pomodoro/pomodoro_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'habitos-estudio': (BuildContext context) => HabitosEstudio(),
      'quien-soy': (BuildContext context) => QuienSoy(),
      'alimentos-acidos': (BuildContext context) => AlimentosAcidos(),
      'service-details-pae': (BuildContext context) => ServiceDetailsScreenPAE(),
      'service-details-sesaes': (BuildContext context) => ServiceDetailsScreenSESAES(),
      'feature-details': (BuildContext context) => FeatureDetails(),
      'pomodoro': (BuildContext context) => PomodoroScreen(),
    };
  }
}