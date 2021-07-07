import 'package:flutter/material.dart';

import 'components/posts_section.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostsSection(),
          PostsSection(),
        ],
      ),
    );
  }
}
