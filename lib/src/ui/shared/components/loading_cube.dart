import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class LoadingCube extends StatelessWidget {
  const LoadingCube();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCubeGrid(
        color: kPrimaryColor,
        size: 100.0,
      ),
    );
  }
}