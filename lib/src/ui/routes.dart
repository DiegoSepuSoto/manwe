import 'package:flutter/material.dart';
import 'package:manwe/src/ui/posts/post_page.dart';
import 'package:manwe/src/ui/services/service_page_with_tabs.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'post-page': (BuildContext context) => PostPage(),
      'service-page': (BuildContext context) => ServicePageWithTabs(),
    };
  }
}