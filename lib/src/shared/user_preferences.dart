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
    _sharedPreferences!.clear();
  }

  static Future<bool> isUserInfoValid() async {
    if (_sharedPreferences!.containsKey("user")) {
      final user = getUserInfo();
      print("token antes: ${user.token}");
      bool isTokenValid = await authenticationRepository.validateToken(user.refreshToken);
      if(isTokenValid) {
        user.token = await authenticationRepository.refreshToken(user.refreshToken);
        print("token despues: ${user.token}");
        return true;
      }
      throw Exception('No shared preferences saved');
    }
    throw Exception('No shared preferences saved');
  }
}