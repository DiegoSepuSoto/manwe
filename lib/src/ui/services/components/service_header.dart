import 'package:flutter/material.dart';
import 'package:manwe/src/ui/shared/components/full_size_image.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class ServiceHeader extends StatelessWidget {
  final String serviceLogoURL;

  const ServiceHeader({required this.serviceLogoURL});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FullSizeImage(
                      image: serviceLogoURL,
                    );
                  },
                ),
              );
            },
            child: CircleAvatar(
              radius: 75.0,
              backgroundColor: kPrimaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(serviceLogoURL),
                radius: 70.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}