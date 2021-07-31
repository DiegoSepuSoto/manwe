import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSectionSESAES extends StatelessWidget {
  const SocialMediaSectionSESAES();

  @override
  Widget build(BuildContext context) {
    final String instagramURL = 'https://www.instagram.com/sesaes.utem';
    final String webSiteURL = 'https://admision.utem.cl/beneficios-estudiantes-utem/salud';
    final String sendEmailURL = 'mailto:enfermeria@utem.cl';

    void handleInstagramButton() async {
      await canLaunch(instagramURL)
          ? await launch(instagramURL)
          : throw 'Could not launch $instagramURL';
    }

    void handleWebSiteButton() async {
      await canLaunch(webSiteURL)
          ? await launch(webSiteURL)
          : throw 'Could not launch $webSiteURL';
    }

    void handleSendEmail() async {
      await canLaunch(sendEmailURL)
          ? await launch(sendEmailURL)
          : throw 'Could not launch $sendEmailURL';
    }

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: handleInstagramButton,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffC21E99),
                  ),
                  child: Text(
                    'Instagram',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: handleSendEmail,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffDB4437),
                  ),
                  child: Text(
                    'Correo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: handleWebSiteButton,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff02ACB3),
                  ),
                  child: Text(
                    'Sitio Web',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
