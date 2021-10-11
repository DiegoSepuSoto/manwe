import 'package:flutter/material.dart';
import 'package:manwe/src/ui/catalog/search_screen.dart';
import 'package:manwe/src/ui/login/login_screen.dart';
import 'package:manwe/src/ui/navigation.dart';
import 'package:manwe/src/ui/posts/post_screen.dart';
import 'package:manwe/src/ui/catalog/posts_by_category_screen.dart';
import 'package:manwe/src/ui/catalog/posts_by_service_screen.dart';
import 'package:manwe/src/ui/profile/profile_screen.dart';
import 'package:manwe/src/ui/services/service_with_tabs_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'login': (BuildContext context) => LoginScreen(),
      'home': (BuildContext context) => Navigation(),
      'profile': (BuildContext context) => ProfileScreen(),
      'post-screen': (BuildContext context) => PostScreen(),
      'service-screen': (BuildContext context) => ServiceWithTabsScreen(),
      'posts-by-service-screen': (BuildContext context) => PostsByServiceScreen(),
      'posts-by-category-screen': (BuildContext context) => PostsByCategoryScreen(),
      'posts-search': (BuildContext context) => SearchScreen()
    };
  }
}