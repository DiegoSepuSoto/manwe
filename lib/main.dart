import 'package:flutter/material.dart';
import 'package:manwe/src/ui/manwe_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(ManweApp());
}
