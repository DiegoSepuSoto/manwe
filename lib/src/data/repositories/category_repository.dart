import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/domain/models/category_posts_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_category_repository.dart';

class CategoryRepository implements AbstractCategoryRepository {
  Future<CategoryPostsScreen> getCategoryPostsScreen(String id) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/category/" + id + "/posts";
      final response = await Dio().get(url);
      final categoryPostsScreen = CategoryPostsScreen.fromJson(response.data);
      return categoryPostsScreen;
    } catch (e) {
      throw Exception('Error loading category posts screen');
    }
  }
}