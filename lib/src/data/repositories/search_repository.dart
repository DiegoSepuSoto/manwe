import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/domain/models/posts_search_result.dart';
import 'package:manwe/src/domain/repositories/abstract_search_repository.dart';
import 'package:manwe/src/shared/interceptors.dart';
import 'package:manwe/src/shared/user_preferences.dart';

class SearchRepository implements AbstractSearchRepository {
  @override
  Future<PostsSearchResult> getPostsSearchResult(String term) async {
    try {
      Dio _client = new Dio();

      final userInfo = UserPreferences.getUserInfo();
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/post/search/${term.toLowerCase()}";
      _client.options.headers["Authorization"] = "Bearer ${userInfo.token}";
      _client.interceptors.add(unauthorizedInterceptor(_client));

      final response = await _client.get(url);

      final postsSearchResult = PostsSearchResult.fromJson(response.data);
      return postsSearchResult;
    } catch (e) {
      throw Exception('Error getting posts search results');
    }
  }

}