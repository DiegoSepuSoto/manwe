class NotificationsScreen {
  NotificationsScreen({
    required this.notifications,
  });

  List<Notification> notifications;

  factory NotificationsScreen.fromJson(Map<String, dynamic> json) => NotificationsScreen(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );
}

class Notification {
  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.serviceName,
    required this.serviceImageUrl,
  });

  String id;
  String title;
  String body;
  String serviceName;
  String serviceImageUrl;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    serviceName: json["service_name"],
    serviceImageUrl: json["service_image_url"],
  );
}