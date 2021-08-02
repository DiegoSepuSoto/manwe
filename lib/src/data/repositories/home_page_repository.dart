import 'package:manwe/src/domain/models/home_page.dart';
import 'package:manwe/src/domain/repositories/abstract_home_page_repository.dart';
import 'package:dio/dio.dart';

class HomePageRepository implements AbstractHomePageRepository {

  @override
  Future<HomePage> getHomePage() async {
    try {
      final url = "http://10.0.2.2:8080/v1/home";
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