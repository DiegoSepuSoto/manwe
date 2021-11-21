import 'package:flutter/material.dart';
import 'package:manwe/src/data/services/push_notifications_service.dart';
import 'package:manwe/src/shared/user_preferences.dart';
import 'package:manwe/src/ui/login/login_screen.dart';
import 'package:manwe/src/ui/navigation.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:manwe/src/ui/routes.dart';

class ManweApp extends StatefulWidget {
  const ManweApp();

  @override
  State<ManweApp> createState() => _ManweAppState();
}

class _ManweAppState extends State<ManweApp> {

  @override
  void initState() {
    super.initState();

    PushNotificationsService.messageStream.listen((message) {
      print("a message was received");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kümelen',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kTextColor,
              fontFamily: 'Nunito',
            ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              brightness: Brightness.dark,
            ),
      ),
      routes: Routes.getRoutes(),
      home: FutureBuilder<bool>(
        future: UserPreferences.isUserInfoValid(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Navigation();
          } else if(snapshot.hasError) {
            return LoginScreen();
          }
          return Scaffold(body: LoadingCube());
        },
      ),
    );
  }
}
