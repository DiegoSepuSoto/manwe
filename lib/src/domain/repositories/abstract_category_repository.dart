import 'package:manwe/src/domain/models/category_posts_page.dart';

abstract class AbstractCategoryRepository {
  Future<CategoryPostsPage> getCategoryPostsPage(String id);
}
