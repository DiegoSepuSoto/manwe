import 'package:manwe/src/domain/models/home_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeRepository implements AbstractHomeRepository {

  @override
  Future<HomeScreen> getHomeScreen() async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/home";
      final response = await Dio().get(
        url,
      );
      final homeScreen = HomeScreen.fromJson(response.data);
      return homeScreen;
    } catch (e) {
      throw Exception('Error loading home screen');
    }
  }
}