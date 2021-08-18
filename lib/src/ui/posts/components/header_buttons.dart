import 'package:flutter/material.dart';
import 'package:manwe/src/ui/shared/components/header_back_button.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class HeaderButtons extends StatelessWidget {
  final String serviceID;

  const HeaderButtons({required this.serviceID});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderBackButton(),
        Spacer(),
        HeaderInfoButton(
          serviceID: serviceID,
        ),
      ],
    );
  }
}

class HeaderInfoButton extends StatelessWidget {
  final String serviceID;

  const HeaderInfoButton({required this.serviceID});

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
          icon: Icon(Icons.info),
          onPressed: () => Navigator.pushNamed(context, 'service-page',
              arguments: serviceID),
        ),
      ),
    );
  }
}
