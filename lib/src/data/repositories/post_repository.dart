import 'package:dio/dio.dart';
import 'package:manwe/src/domain/models/post_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_post_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/shared/interceptors.dart';
import 'package:manwe/src/shared/user_preferences.dart';

class PostRepository implements AbstractPostRepository {

  Future<PostScreen> getPostScreen(String id) async {
    try {
      Dio _client = new Dio();

      final userInfo = UserPreferences.getUserInfo();

      final url = "${dotenv.env['ELENTARI_HOST']}/v1/post/" + id;
      _client.options.headers["Authorization"] = "Bearer ${userInfo.token}";
      _client.interceptors.add(unauthorizedInterceptor(_client));

      final response = await _client.get(url);

      final postScreen = PostScreen.fromJson(response.data);
      return postScreen;
    } catch (e) {
      throw Exception('Error loading post screen');
    }
  }
}