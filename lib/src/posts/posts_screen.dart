import 'package:flutter/material.dart';
import 'package:manwe/src/posts/components/posts_section_sesaes.dart';

import 'components/posts_section_pae.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostsSectionPAE(),
          PostsSectionSESAES()
        ],
      ),
    );
  }
}
