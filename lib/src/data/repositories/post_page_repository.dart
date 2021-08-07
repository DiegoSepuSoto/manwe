import 'package:dio/dio.dart';
import 'package:manwe/src/domain/models/post_page.dart';
import 'package:manwe/src/domain/repositories/abstract_post_page_repository.dart';

class PostPageRepository implements AbstractPostPageRepository {

  Future<PostPage> getPostPage(String id) async {
    try {
      final url = "http://10.0.2.2:8080/v1/post/" + id;
      final response = await Dio().get(
        url,
      );
      final homePage = PostPage.fromJson(response.data);
      return homePage;
    } catch (e) {
      throw Exception('Error loading post page');
    }
  }
}