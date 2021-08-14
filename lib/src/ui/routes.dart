import 'package:flutter/material.dart';
import 'package:manwe/src/ui/posts/post_page.dart';
import 'package:manwe/src/ui/shared/service_details/service_details_screen_pae.dart';
import 'package:manwe/src/ui/shared/service_details/service_details_screen_sesaes.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'post-page': (BuildContext context) => PostPage(),
      'service-details-pae': (BuildContext context) => ServiceDetailsScreenPAE(),
      'service-details-sesaes': (BuildContext context) => ServiceDetailsScreenSESAES(),
    };
  }
}