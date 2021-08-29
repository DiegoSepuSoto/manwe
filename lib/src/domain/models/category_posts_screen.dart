import 'package:manwe/src/domain/models/home_screen.dart';

class CategoryPostsScreen {
  CategoryPostsScreen({
    required this.id,
    required this.name,
    required this.postsForPreview,
  });

  String id;
  String name;
  List<PostForPreview> postsForPreview;

  factory CategoryPostsScreen.fromJson(Map<String, dynamic> json) =>
      CategoryPostsScreen(
        id: json["id"],
        name: json["name"],
        postsForPreview: List<PostForPreview>.from(
          json["posts_for_preview"].map((x) => PostForPreview.fromJson(x)),
        ),
      );
}
