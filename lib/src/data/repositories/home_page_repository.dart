import 'package:manwe/src/domain/models/home_page.dart';
import 'package:manwe/src/domain/repositories/abstract_home_page_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePageRepository implements AbstractHomePageRepository {

  @override
  Future<HomePage> getHomePage() async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/home";
      final response = await Dio().get(
        url,
      );
      final homePage = HomePage.fromJson(response.data);
      return homePage;
    } catch (e) {
      throw Exception('Error loading home page');
    }
  }
}