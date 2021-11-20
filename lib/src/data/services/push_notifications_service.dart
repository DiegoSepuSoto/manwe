import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:manwe/src/shared/user_preferences.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? deviceID;
  static final StreamController<String> _messageStreamController = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future<void> _backgroundHandler(RemoteMessage remoteMessage) async {
    _messageStreamController.add(remoteMessage.notification?.title ?? "");
  }

  static Future<void> _onMessageHandler(RemoteMessage remoteMessage) async {
    _messageStreamController.add(remoteMessage.notification?.title ?? "");
  }

  static Future<void> _onMessageOpenAppHandler(RemoteMessage remoteMessage) async {
    _messageStreamController.add(remoteMessage.notification?.title ?? "");
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    await messaging.getInitialMessage();
    deviceID = await FirebaseMessaging.instance.getToken();
    UserPreferences.setDeviceID(deviceID!);

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenAppHandler);
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}