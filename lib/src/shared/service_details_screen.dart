import 'package:flutter/material.dart';
import 'package:manwe/src/utils/constants.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen();

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(
                    'assets/images/logo_pae.png',
                    width: 200.0,
                    height: 170.0,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    'Plan de Apoyo Estudiantil',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut consectetur nunc. Cras quis venenatis metus, nec varius velit. Etiam auctor eget libero egestas mattis. Cras in est at nunc interdum vulputate. Vestibulum vitae facilisis metus, quis mattis odio. Praesent iaculis id leo eu pretium. Nulla in justo at nunc egestas luctus nec ut quam. Sed nisi ligula, gravida et venenatis at, elementum sed leo. Donec condimentum neque eget rhoncus vestibulum. Vivamus porta eros et odio posuere aliquet. Vivamus sed massa nunc. Vestibulum blandit auctor libero at feugiat. Fusce urna nunc, pretium ut magna in, laoreet porta turpis. Donec vitae lorem in neque aliquam euismod.\n Donec bibendum augue eget justo suscipit, quis auctor purus sagittis. Nulla facilisis erat erat, a tristique nulla euismod nec. Mauris feugiat velit quis egestas placerat. Nullam tincidunt urna non augue hendrerit, eu rutrum quam scelerisque. Sed mauris massa, volutpat id bibendum posuere, vestibulum sed erat. In tortor felis, mattis ut risus quis, viverra lobortis nunc. Nam sodales, libero maximus volutpat volutpat, eros mauris iaculis lectus, ac tincidunt nisi ex vel dolor. In interdum augue sed lectus consectetur, quis ullamcorper sapien malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer malesuada elit fermentum ligula fringilla, vel facilisis risus efficitur. Interdum et malesuada fames ac ante ipsum primis in faucibus\n Etiam sed gravida dui, sed viverra purus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur et posuere risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin vel elit tristique, pulvinar metus at, euismod metus. Nullam eget posuere purus. Quisque placerat fermentum massa. Sed vestibulum consectetur ipsum et facilisis. Nam orci dolor, elementum nec magna ut, tempus luctus justo. Duis libero magna, efficitur in sodales quis, blandit ac sapien. Integer ac nisl lacus\n In mauris ligula, commodo et sem at, hendrerit euismod neque. In iaculis neque ut ante imperdiet iaculis. Nulla enim leo, facilisis id facilisis nec, laoreet id tellus. Quisque sollicitudin, tortor eu pharetra malesuada, elit ex tincidunt augue, feugiat elementum urna orci at lectus. Etiam malesuada lorem ante, vel fermentum metus semper at. Sed lacinia et ante sed feugiat. Aliquam egestas, nibh ac auctor consectetur, libero tortor consectetur orci, at commodo mauris felis et quam\n Nullam molestie, ante ac tempus placerat, ex libero fermentum nunc, at hendrerit ligula nisi a ante. Pellentesque nec sem vulputate, auctor metus vel, mollis augue. Praesent vitae risus sit amet risus maximus interdum. Quisque tortor ipsum, pellentesque ut libero a, facilisis malesuada augue. Cras vitae urna eros. Donec eu nisi a enim molestie efficitur. Nullam mattis, purus sollicitudin consectetur sagittis, lacus libero gravida orci, et efficitur nulla lacus et justo.'),
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
