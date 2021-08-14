import 'package:dio/dio.dart';
import 'package:manwe/src/domain/models/post_page.dart';
import 'package:manwe/src/domain/repositories/abstract_post_page_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostPageRepository implements AbstractPostPageRepository {

  Future<PostPage> getPostPage(String id) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/post/" + id;
      final response = await Dio().get(
        url,
      );
      final postPage = PostPage.fromJson(response.data);
      print(postPage.categories[0].name);
      return postPage;
    } catch (e) {
      throw Exception('Error loading post page');
    }
  }
}