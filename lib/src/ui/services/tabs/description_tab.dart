import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/service_page.dart';
import 'package:manwe/src/ui/services/components/service_header.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:manwe/src/ui/utils/functions.dart';

class DescriptionTab extends StatelessWidget {
  final String logoURL;
  final String description;

  const DescriptionTab({required this.logoURL, required this.description});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ServiceHeader(
              serviceLogoURL: logoURL,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(kDefaultPadding),
              child: MarkdownBody(
                data: description,
                styleSheet: buildPageMarkdownBody(),
              ),
            ),
            SizedBox(
              height: kDefaultPadding * 2,
            )
          ],
        ),
      ),
    );
  }
}