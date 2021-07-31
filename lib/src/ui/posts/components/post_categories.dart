import 'package:flutter/material.dart';
import 'package:manwe/src/ui/posts/components/post_category.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class PostCategories extends StatelessWidget {
  final List<String> categories;

  const PostCategories({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      padding: EdgeInsets.only(right: kDefaultPadding, top: kDefaultPadding),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext ctx, int index) {
          return PostCategory(
            category: categories[index],
          );
        },
      )
    );
  }
}
