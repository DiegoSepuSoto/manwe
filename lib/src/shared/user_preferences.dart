import 'dart:convert';

import 'package:manwe/src/domain/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setUserInfo(User userInfo) async {
    await _sharedPreferences!.setString("user", json.encode(userInfo));
  }

  static User getUserInfo() {
    return User.fromJson(json.decode(_sharedPreferences!.getString("user") ?? ""));
  }

  static String getUserFirstName() {
    final user = getUserInfo();

    return user.fullName.split(" ")[0];
  }
}