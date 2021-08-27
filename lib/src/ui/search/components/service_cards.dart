import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/search_page.dart';
import 'package:manwe/src/ui/search/components/service_card.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class ServiceCards extends StatelessWidget {
  final List<Service> services;

  const ServiceCards({required this.services});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.17,
      margin: EdgeInsets.only(
        top: kDefaultPadding,
        left: kDefaultPadding,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ServiceCard(
            id: services[index].id,
            name: services[index].name,
            imageURL: services[index].logoUrl,
          );
        },
      ),
    );
  }
}
