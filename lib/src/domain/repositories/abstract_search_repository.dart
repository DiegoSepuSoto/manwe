import 'package:manwe/src/domain/models/posts_search_result.dart';

abstract class AbstractSearchRepository {
  Future<PostsSearchResult> getPostsSearchResult(String term);
}