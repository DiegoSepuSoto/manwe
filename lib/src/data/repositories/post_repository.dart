import 'package:dio/dio.dart';
import 'package:manwe/src/domain/models/post_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_post_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostRepository implements AbstractPostRepository {

  Future<PostScreen> getPostScreen(String id) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/post/" + id;
      final response = await Dio().get(
        url,
      );
      final postScreen = PostScreen.fromJson(response.data);
      return postScreen;
    } catch (e) {
      throw Exception('Error loading post screen');
    }
  }
}