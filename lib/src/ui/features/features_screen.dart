import 'package:flutter/material.dart';

import 'components/feature_card.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          FeatureCard(
            title: 'Técnica Pomodoro',
            imagePath: 'assets/images/pomodoro.jpg',
          )
        ],
      ),
    );
  }
}
