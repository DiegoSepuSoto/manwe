import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

MarkdownStyleSheet buildNotificationMarkdownBody() {
  return MarkdownStyleSheet(
    h1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
    p: TextStyle(
      fontSize: 14.0,
    ),
  );
}

MarkdownStyleSheet buildPostMarkdownBody() {
  return MarkdownStyleSheet(
    h1: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    ),
    p: TextStyle(
      fontSize: 17.0,
    ),
  );
}

showAlertDialogToOpenLink(BuildContext context, String link) {
  Widget cancelButton = ElevatedButton(
    child: Text("Cancelar"),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
    ),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = ElevatedButton(
    child: Text("Continuar"),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
    ),
    onPressed:  () {
      launch(link);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Abrir enlace"),
    content: Text("Serás ridirigido a: $link"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}