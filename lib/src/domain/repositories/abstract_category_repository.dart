import 'package:manwe/src/domain/models/category_posts_screen.dart';

abstract class AbstractCategoryRepository {
  Future<CategoryPostsScreen> getCategoryPostsScreen(String id);
}
