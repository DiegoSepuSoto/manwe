import 'package:manwe/src/domain/models/user.dart';

abstract class AbstractAuthenticationRepository {
  Future<User> logIn(String email, password);
}