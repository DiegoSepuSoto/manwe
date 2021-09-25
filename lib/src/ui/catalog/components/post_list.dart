import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/home_screen.dart';
import 'package:manwe/src/ui/catalog/components/post_list_item.dart';

class PostList extends StatelessWidget {
  final List<PostForPreview> posts;

  const PostList({required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 0.0),
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostListItem(
          id: posts[index].id,
          imageURL: posts[index].imageUrl,
          title: posts[index].title,
          summary: posts[index].summary,
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
    );
  }
}
