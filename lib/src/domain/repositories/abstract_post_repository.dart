import 'package:manwe/src/domain/models/post_screen.dart';

abstract class AbstractPostRepository {
  Future<PostScreen> getPostScreen(String id);
}