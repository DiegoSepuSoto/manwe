import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/domain/models/user.dart';
import 'package:manwe/src/domain/repositories/abstract_authentication_repository.dart';

class AuthenticationRepositoryImplementation implements AbstractAuthenticationRepository {
  @override
  Future<User> logIn(String email, password) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/auth/login";

      final data = {
        "email": email,
        "password": password,
      };

      final response = await Dio().post(
        url,
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'})
      );

      final user = User.fromJson(response.data);

      return user;
    } catch (e) {
      print(e.toString());
      throw Exception("Error executing login");
    }
  }
}