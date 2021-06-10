import 'package:flutter/material.dart';
import 'package:manwe/src/features/feature_details.dart';
import 'package:manwe/src/features/features_screens/pomodoro/pomodoro_screen.dart';
import 'package:manwe/src/news/news_details.dart';
import 'package:manwe/src/shared/service_details_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'news-details': (BuildContext context) => NewsDetails(),
      'service-details': (BuildContext context) => ServiceDetailsScreen(),
      'feature-details': (BuildContext context) => FeatureDetails(),
      'pomodoro': (BuildContext context) => PomodoroScreen(),
    };
  }
}