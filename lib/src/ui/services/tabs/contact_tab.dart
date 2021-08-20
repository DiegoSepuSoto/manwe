import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/service_page.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTab extends StatelessWidget {
  final List<Contact> contacts;

  const ContactTab({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: kDefaultPadding),
                child: contactButtonBuilder(contacts[index]),
              ),
            );
          },
          itemCount: contacts.length,
        ),
      ),
    );
  }
}

Widget contactButtonBuilder(Contact contact) {
  switch (contact.type) {
    case 'Facebook':
      return FacebookButton(link: contact.link);
    case 'Instagram':
      return InstagramButton(link: contact.link);
    case 'Correo':
      return MailButton(email: contact.link);
    case 'Web':
      return WebPageButton(link: contact.link);
    default:
      return WebPageButton(link: contact.link);
  }
}

void handleButtonOpenLink(String link) async {
  await canLaunch(link)
      ? await launch(link)
      : throw 'Could not launch $link';
}

class FacebookButton extends StatelessWidget {
  final String link;

  const FacebookButton({required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5.0,
          )
        ],
        color: Color(0xff0177FC),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          handleButtonOpenLink(link);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(Icons.facebook),
            Spacer(),
            Text(
              'Facebook',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InstagramButton extends StatelessWidget {
  final String link;

  const InstagramButton({required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5.0,
          )
        ],
        gradient: LinearGradient(
          colors: [Color(0xFF915FB5), Color(0xFFCA436B)],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          handleButtonOpenLink(link);
        },
        child: Row(
          children: [
            FaIcon(FontAwesomeIcons.instagram),
            Spacer(),
            Text(
              'Instagram',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MailButton extends StatelessWidget {
  final String email;

  const MailButton({required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5.0,
          )
        ],
        color: Color(0xffEA4335),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          handleButtonOpenLink('mailto:$email');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(Icons.mail),
            Spacer(),
            Text(
              'Enviar Correo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WebPageButton extends StatelessWidget {
  final String link;

  const WebPageButton({required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5.0,
          )
        ],
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          handleButtonOpenLink(link);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(Icons.web),
            Spacer(),
            Text(
              'Ver Sitio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
