import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manwe/src/features/features_screen.dart';
import 'package:manwe/src/news/news_screen.dart';
import 'package:manwe/src/notifications/notifications_screen.dart';
import 'package:manwe/src/shared/components/app_bar.dart';
import 'package:manwe/src/utils/constants.dart';

class Navigation extends StatefulWidget {
  const Navigation();

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    NewsScreen(),
    FeaturesScreen(),
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
      statusBarColor: kPrimaryColor,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: _pages.elementAt(_selectedIndex),
        ),
        appBar: buildAppBar(),
        bottomNavigationBar: FancyBottomNavigation(
          textColor: kTextColor,
          onTabChangedListener: _onItemTapped,
          tabs: [
            TabData(
              iconData: Icons.file_copy_rounded,
              title: 'Publicaciones',
            ),
            TabData(
              iconData: Icons.edit,
              title: 'Herramientas',
            ),
            TabData(
              iconData: Icons.notifications_active,
              title: 'Notificaciones',
            )
          ],
        ),
      ),
    );
  }
}
