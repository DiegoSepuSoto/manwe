class HomeScreen {
  HomeScreen({
    required this.servicesWithPosts,
  });

  List<ServicesWithPost> servicesWithPosts;

  factory HomeScreen.fromJson(Map<String, dynamic> json) => HomeScreen(
        servicesWithPosts: List<ServicesWithPost>.from(
          json["services_with_posts"].map((x) => ServicesWithPost.fromJson(x)),
        ),
      );
}

class ServicesWithPost {
  ServicesWithPost({
    required this.id,
    required this.abbreviation,
    required this.postsForPreview,
  });

  String id;
  String abbreviation;
  List<PostForPreview> postsForPreview;

  factory ServicesWithPost.fromJson(Map<String, dynamic> json) =>
      ServicesWithPost(
        id: json["id"],
        abbreviation: json["abbreviation"],
        postsForPreview: List<PostForPreview>.from(
          json["posts_for_preview"].map((x) => PostForPreview.fromJson(x)),
        ),
      );
}

class PostForPreview {
  PostForPreview({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
  });

  String id;
  String title;
  String summary;
  String imageUrl;

  factory PostForPreview.fromJson(Map<String, dynamic> json) => PostForPreview(
        id: json["id"],
        title: json["title"],
        summary: json["summary"],
        imageUrl: json["image_url"],
      );
}
