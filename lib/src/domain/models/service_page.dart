class ServicePage {
  ServicePage({
    required this.id,
    required this.logoUrl,
    required this.name,
    required this.description,
  });

  String id;
  String logoUrl;
  String name;
  String description;

  factory ServicePage.fromJson(Map<String, dynamic> json) => ServicePage(
    id: json["id"],
    logoUrl: json["logo_url"],
    name: json["name"],
    description: json["description"],
  );
}
