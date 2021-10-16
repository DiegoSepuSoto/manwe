import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/domain/models/category_posts_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_category_repository.dart';
import 'package:manwe/src/shared/interceptors.dart';
import 'package:manwe/src/shared/user_preferences.dart';

class CategoryRepository implements AbstractCategoryRepository {
  Future<CategoryPostsScreen> getCategoryPostsScreen(String id) async {
    try {
      Dio _client = new Dio();

      final userInfo = UserPreferences.getUserInfo();
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/category/" + id + "/posts";
      _client.options.headers["Authorization"] = "Bearer ${userInfo.token}";
      _client.interceptors.add(unauthorizedInterceptor(_client));

      final response = await _client.get(url);

      final categoryPostsScreen = CategoryPostsScreen.fromJson(response.data);
      return categoryPostsScreen;
    } catch (e) {
      throw Exception('Error loading category posts screen');
    }
  }
}