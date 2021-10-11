import 'package:manwe/src/domain/models/user.dart';

abstract class AbstractAuthenticationRepository {
  Future<User> logIn(String email, password);
  Future<bool> validateToken(String token);
  Future<String> refreshToken(String refreshToken);
}