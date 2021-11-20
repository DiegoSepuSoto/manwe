import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/domain/models/user.dart';
import 'package:manwe/src/domain/repositories/abstract_authentication_repository.dart';

class AuthenticationRepositoryImplementation implements AbstractAuthenticationRepository {
  @override
  Future<User> logIn(String email, password, deviceID) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/auth/login";

      final data = {
        "email": email,
        "password": password,
        "device_id": deviceID,
      };

      final response = await Dio().post(
        url,
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'})
      );

      final user = User.fromJson(response.data);

      return user;
    } catch (e) {
      throw Exception("Error executing login");
    }
  }

  Future<bool> validateToken(String token) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/auth/validate-token";

      final response = await Dio().post(
          url,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          })
      );

      if(response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Error executing login");
    }
  }

  Future<String> refreshToken(String refreshToken) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/auth/refresh-token";

      final response = await Dio().post(
          url,
          options: Options(headers: {
            'Authorization': 'Bearer $refreshToken',
            'Content-Type': 'application/json'
          })
      );

      return response.data["token"];
    } catch (e) {
      throw Exception("Error executing login");
    }
  }
}