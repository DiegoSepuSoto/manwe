import 'package:flutter/material.dart';
import 'package:manwe/src/posts/components/post_category.dart';
import 'package:manwe/src/utils/constants.dart';

class PostCategories extends StatelessWidget {
  const PostCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: kDefaultPadding, top: kDefaultPadding),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            PostCategory(
              category: 'Apoyo Académico',
            ),
            PostCategory(
              category: 'Hábitos',
            ),
            PostCategory(
              category: 'Primeros Años',
            ),
            PostCategory(
              category: 'Ramos difíciles',
            ),
          ],
        ),
      ),
    );
  }
}
