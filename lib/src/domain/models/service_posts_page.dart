import 'package:manwe/src/domain/models/home_page.dart';

class ServicePostsPage {
  ServicePostsPage({
    required this.id,
    required this.name,
    required this.postsForPreview,
  });

  String id;
  String name;
  List<PostForPreview> postsForPreview;

  factory ServicePostsPage.fromJson(Map<String, dynamic> json) =>
      ServicePostsPage(
        id: json["id"],
        name: json["name"],
        postsForPreview: List<PostForPreview>.from(
            json["posts_for_preview"].map((x) => PostForPreview.fromJson(x))),
      );
}
