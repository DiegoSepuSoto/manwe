import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/domain/models/category_posts_page.dart';
import 'package:manwe/src/domain/repositories/abstract_category_repository.dart';

class CategoryRepository implements AbstractCategoryRepository {
  Future<CategoryPostsPage> getCategoryPostsPage(String id) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/category/" + id + "/posts";
      final response = await Dio().get(url);
      final categoryPostsPage = CategoryPostsPage.fromJson(response.data);
      return categoryPostsPage;
    } catch (e) {
      throw Exception('Error loading category posts page');
    }
  }
}