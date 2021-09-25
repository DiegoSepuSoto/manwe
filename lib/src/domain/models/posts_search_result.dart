import 'package:manwe/src/domain/models/home_screen.dart';

class PostsSearchResult {
  PostsSearchResult({
    required this.posts,
  });

  List<PostForPreview> posts;

  factory PostsSearchResult.fromJson(Map<String, dynamic> json) => PostsSearchResult(
    posts: List<PostForPreview>.from(json["posts"].map((x) => PostForPreview.fromJson(x))),
  );
}
