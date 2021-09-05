import 'package:flutter/material.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class ProfesionaListItem extends StatelessWidget {
  final String name;
  final String charge;
  final String email;
  final String profilePictureURL;

  const ProfesionaListItem({
    required this.name,
    required this.charge,
    required this.email,
    required this.profilePictureURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: kDefaultPadding),
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 40.0,
              child: CircleAvatar(
                radius: 35.0,
                backgroundColor: kPrimaryColor,
                backgroundImage: NetworkImage(profilePictureURL),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfesionalName(
                  name: name,
                ),
                ProfesionalCharge(charge: charge),
                ProfesionalEmail(email: email)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfesionalName extends StatelessWidget {
  final String name;

  const ProfesionalName({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProfesionalCharge extends StatelessWidget {
  final String charge;

  const ProfesionalCharge({required this.charge});

  @override
  Widget build(BuildContext context) {
    return Text(
      charge,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}

class ProfesionalEmail extends StatelessWidget {
  final String email;

  const ProfesionalEmail({required this.email});

  @override
  Widget build(BuildContext context) {
    return Text(
      email,
      style: TextStyle(
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
