import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manwe/src/ui/posts/posts_screen.dart';
import 'package:manwe/src/ui/search/search_screen.dart';
import 'package:manwe/src/ui/shared/components/main_app_bar.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'notifications/notifications_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation();

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const List<Widget> _screen = [
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
              child: _screen.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
      // appBar: buildAppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: FancyBottomNavigation(
            textColor: kTextColor,
            onTabChangedListener: _onItemTapped,
            iconTextOffScreen: 6,
            hasElevation: false,
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
        ),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.mail_outline),
          onPressed: handleSendFeedback,
        )
    );
  }
}

void handleSendFeedback() async {
  await canLaunch('mailto:diego.sepulvedas@utem.cl?subject=Feedback%20App%20K%C3%BCmelen')
      ? await launch('mailto:diego.sepulvedas@utem.cl?subject=Feedback%20App%20K%C3%BCmelen')
      : throw 'Could not launch mailto:diego.sepulvedas@utem.cl';
}
