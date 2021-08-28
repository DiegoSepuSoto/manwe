import 'package:manwe/src/domain/models/service_page.dart';
import 'package:manwe/src/domain/models/service_posts_page.dart';

abstract class AbstractServiceRepository {
  Future<ServicePage> getServicePage(String id);
  Future<ServicePostsPage> getServicePosts(String id);
}