import 'dart:convert';

import 'package:manwe/src/data/repositories/authentication_repository.dart';
import 'package:manwe/src/domain/models/user.dart';
import 'package:manwe/src/domain/repositories/abstract_authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late AbstractAuthenticationRepository authenticationRepository;
  static SharedPreferences? _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    authenticationRepository = AuthenticationRepositoryImplementation();
  }

  static Future setDeviceID(String deviceID) async {
    await _sharedPreferences!.setString("deviceID", deviceID);
  }

  static String getDeviceID() {
    return _sharedPreferences!.getString("deviceID") ?? "";
}

  static Future setUserInfo(User userInfo) async {
    await _sharedPreferences!.setString("user", json.encode(userInfo));
  }

  static User getUserInfo() {
    return User.fromJson(
        json.decode(_sharedPreferences!.getString("user") ?? ""));
  }

  static String getUserFirstName() {
    final user = getUserInfo();

    return user.fullName.split(" ")[0];
  }

  static void deleteUserInfo() {
    _sharedPreferences!.remove("user");
  }

  static Future<String> getUpdatedToken() async {
    final user = getUserInfo();
    final newToken = await authenticationRepository.refreshToken(user.refreshToken);
    user.token = newToken;
    setUserInfo(user);
    return newToken;
  }

  static Future<bool> isUserInfoValid() async {
    if (_sharedPreferences!.containsKey("user")) {
      final user = getUserInfo();
      bool isTokenValid = await authenticationRepository.validateToken(user.refreshToken);
      if(isTokenValid) {
        await getUpdatedToken();
        return true;
      }
      throw Exception('No shared preferences saved');
    }
    throw Exception('No shared preferences saved');
  }

  static Future setShowOnBoarding(bool showOnBoarding) async {
    await _sharedPreferences!.setBool("showOnBoarding", showOnBoarding);
  }

  static Future<bool> getShowOnBoarding() async {
    return _sharedPreferences!.getBool("showOnBoarding") ?? false;
  }
}