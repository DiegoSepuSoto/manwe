import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/domain/models/posts_search_result.dart';
import 'package:manwe/src/domain/repositories/abstract_search_repository.dart';

class SearchRepository implements AbstractSearchRepository {
  @override
  Future<PostsSearchResult> getPostsSearchResult(String term) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/post/search/${term.toLowerCase()}";
      final response = await Dio().get(url);
      final postsSearchResult = PostsSearchResult.fromJson(response.data);
      return postsSearchResult;
    } catch (e) {
      throw Exception('Error getting posts search results');
    }
  }

}