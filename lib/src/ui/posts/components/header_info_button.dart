import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class HeaderInfoButton extends StatelessWidget {
  final String serviceDetailsRoute;

  const HeaderInfoButton({required this.serviceDetailsRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: kDefaultPadding),
      child: CircleAvatar(
        backgroundColor: kPrimaryColor,
        radius: 25.0,
        child: IconButton(
          color: Colors.white,
          alignment: Alignment.center,
          icon:  Icon(Icons.info),
          onPressed: () => Navigator.pushNamed(context, serviceDetailsRoute),
        ),
      ),
    );
  }
}
