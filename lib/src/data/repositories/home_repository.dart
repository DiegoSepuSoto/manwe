import 'package:manwe/src/domain/models/home_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/shared/interceptors.dart';
import 'package:manwe/src/shared/user_preferences.dart';

class HomeRepository implements AbstractHomeRepository {
  @override
  Future<HomeScreen> getHomeScreen() async {
    try {
      Dio _client = new Dio();

      var userInfo = UserPreferences.getUserInfo();
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/home";
      _client.options.headers["Authorization"] = "Bearer ${userInfo.token}";
      _client.interceptors.add(unauthorizedInterceptor(_client));

      final response = await _client.get(url);

      final homeScreen = HomeScreen.fromJson(response.data);
      return homeScreen;
    } catch (e) {
      throw Exception('Error loading home screen');
    }
  }
}
