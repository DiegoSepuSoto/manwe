import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class FeatureDetails extends StatelessWidget {
  const FeatureDetails();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: kDefaultPadding),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kTextColor,
                      size: 26.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    'Técnica Pomodoro',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    top: kDefaultPadding,
                  ),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut consectetur nunc. Cras quis venenatis metus, nec varius velit. Etiam auctor eget libero egestas mattis. Cras in est at nunc interdum vulputate. Vestibulum vitae facilisis metus, quis mattis odio. Praesent iaculis id leo eu pretium. Nulla in justo at nunc egestas luctus nec ut quam. Sed nisi ligula, gravida et venenatis at, elementum sed leo. Donec condimentum neque eget rhoncus vestibulum. Vivamus porta eros et odio posuere aliquet. Vivamus sed massa nunc. Vestibulum blandit auctor libero at feugiat. Fusce urna nunc, pretium ut magna in, laoreet porta turpis. Donec vitae lorem in neque aliquam euismod.\n'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Text('Utilizar la herramienta'),
                        Spacer(),
                        Icon(Icons.forward),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
