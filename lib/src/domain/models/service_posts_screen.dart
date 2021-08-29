import 'package:manwe/src/domain/models/home_screen.dart';

class ServicePostsScreen {
  ServicePostsScreen({
    required this.id,
    required this.name,
    required this.postsForPreview,
  });

  String id;
  String name;
  List<PostForPreview> postsForPreview;

  factory ServicePostsScreen.fromJson(Map<String, dynamic> json) =>
      ServicePostsScreen(
        id: json["id"],
        name: json["name"],
        postsForPreview: List<PostForPreview>.from(
          json["posts_for_preview"].map((x) => PostForPreview.fromJson(x)),
        ),
      );
}
