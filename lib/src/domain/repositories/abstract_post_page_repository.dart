import 'package:manwe/src/domain/models/post_page.dart';

abstract class AbstractPostPageRepository {
  Future<PostPage> getPostPage(String id);
}