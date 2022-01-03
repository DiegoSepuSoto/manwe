import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/domain/models/notifications_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_notification_repository.dart';
import 'package:manwe/src/shared/interceptors.dart';
import 'package:manwe/src/shared/user_preferences.dart';

class NotificationRepository implements AbstractNotificationRepository {
  @override
  Future<NotificationsScreen> getNotificationsScreen() async {
    try {
      Dio _client = new Dio();

      var userInfo = UserPreferences.getUserInfo();
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/notification";
      _client.options.headers["Authorization"] = "Bearer ${userInfo.token}";
      _client.interceptors.add(unauthorizedInterceptor(_client));

      final response = await _client.get(url);

      final notificationsScreen = NotificationsScreen.fromJson(response.data);
      return notificationsScreen;
    } catch (e) {
      throw Exception('Error loading notifications page');
    }
  }

}