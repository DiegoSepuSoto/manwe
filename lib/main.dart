import 'package:flutter/material.dart';
import 'package:manwe/src/data/services/push_notifications_service.dart';
import 'package:manwe/src/shared/user_preferences.dart';
import 'package:manwe/src/ui/manwe_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await UserPreferences.init();

  await PushNotificationsService.initializeApp();

  runApp(ManweApp());
}
