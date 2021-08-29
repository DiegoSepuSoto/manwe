class SearchScreen {
  SearchScreen({
    required this.services,
    required this.categories,
  });

  List<Service> services;
  List<Category> categories;

  factory SearchScreen.fromJson(Map<String, dynamic> json) => SearchScreen(
        services: List<Service>.from(
          json["services"].map((x) => Service.fromJson(x)),
        ),
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

class Service {
  Service({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  String id;
  String name;
  String logoUrl;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        logoUrl: json["logo_url"],
      );
}
