import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manwe/src/features/features_screen.dart';
import 'package:manwe/src/posts/posts_screen.dart';
import 'package:manwe/src/notifications/notifications_screen.dart';
import 'package:manwe/src/search/search_screen.dart';
import 'package:manwe/src/shared/components/main_app_bar.dart';
import 'package:manwe/src/utils/constants.dart';

class Navigation extends StatefulWidget {
  const Navigation();

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    PostsScreen(),
    SearchScreen(),
    NotificationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Column(
        children: [
          MainAppBar(),
          Expanded(
            child: Container(
              child: _pages.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
      // appBar: buildAppBar(),
      bottomNavigationBar: FancyBottomNavigation(
        textColor: kTextColor,
        onTabChangedListener: _onItemTapped,
        tabs: [
          TabData(
            iconData: Icons.home,
            title: 'Publicaciones',
          ),
          TabData(
            iconData: Icons.search,
            title: 'Buscar',
          ),
          TabData(
            iconData: Icons.notifications_active,
            title: 'Notificaciones',
          )
        ],
      ),
    );
  }
}
