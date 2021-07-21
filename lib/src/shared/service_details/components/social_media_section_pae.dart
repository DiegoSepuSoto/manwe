import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSectionPAE extends StatelessWidget {
  const SocialMediaSectionPAE();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final String facebookURL = 'https://www.facebook.com/plandeapoyoestudiantil';
    final String instagramURL = 'https://www.instagram.com/pae_utem';
    final String webSiteURL = 'https://vrac.utem.cl/estudiantes/plan-de-apoyo-estudiantil';
    final String sendEmailURL = 'mailto:pae@utem.cl';

    void handleFacebookButton() async {
      await canLaunch(facebookURL)
          ? await launch(facebookURL)
          : throw 'Could not launch $facebookURL';
    }

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
                  onPressed: handleFacebookButton,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff1778F2),
                  ),
                  child: Text(
                    'Facebook',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Spacer(),
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
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: size.width * 0.7,
                    height: 40,
                  ),
                  child: ElevatedButton(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
