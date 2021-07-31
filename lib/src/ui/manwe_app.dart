import 'package:flutter/material.dart';
import 'package:manwe/src/ui/navigation.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:manwe/src/ui/routes.dart';

class ManweApp extends StatelessWidget {
  const ManweApp();

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
      ),
      routes: Routes.getRoutes(),
      home: Navigation(),
    );
  }
}