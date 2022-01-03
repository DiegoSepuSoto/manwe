import 'package:manwe/src/domain/models/notifications_screen.dart';

abstract class AbstractNotificationRepository {
  Future<NotificationsScreen> getNotificationsScreen();
}