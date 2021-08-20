class ServicePage {
  ServicePage({
    required this.id,
    required this.logoUrl,
    required this.name,
    required this.description,
    required this.persons,
    required this.contacts,
  });

  String id;
  String logoUrl;
  String name;
  String description;
  List<Person> persons;
  List<Contact> contacts;

  factory ServicePage.fromJson(Map<String, dynamic> json) => ServicePage(
    id: json["id"],
    logoUrl: json["logo_url"],
    name: json["name"],
    description: json["description"],
    persons: List<Person>.from(json["persons"].map((x) => Person.fromJson(x))),
    contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
  );
}

class Contact {
  Contact({
    required this.id,
    required this.name,
    required this.type,
    required this.link,
  });

  String id;
  String name;
  String type;
  String link;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    link: json["link"],
  );
}

class Person {
  Person({
    required this.id,
    required this.name,
    required this.charge,
    required this.email,
    required this.profilePictureUrl,
  });

  String id;
  String name;
  String charge;
  String email;
  String profilePictureUrl;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    name: json["name"],
    charge: json["charge"],
    email: json["email"],
    profilePictureUrl: json["profile_picture_url"],
  );
}
