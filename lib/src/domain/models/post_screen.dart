class PostScreen {
  PostScreen({
    required this.id,
    required this.title,
    required this.image,
    required this.body,
    required this.serviceId,
    required this.serviceName,
    required this.categories,
  });

  String id;
  String title;
  String image;
  String body;
  String serviceId;
  String serviceName;
  List<Category> categories;

  factory PostScreen.fromJson(Map<String, dynamic> json) => PostScreen(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        body: json["body"],
        serviceId: json["service_id"],
        serviceName: json["service_name"],
        categories: List<Category>.from(
          json["categories"].map((x) => Category.fromJson(x)),
        ),
      );
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );
}
