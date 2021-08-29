import 'package:manwe/src/domain/models/service_screen.dart';
import 'package:manwe/src/domain/models/service_posts_screen.dart';

abstract class AbstractServiceRepository {
  Future<ServiceScreen> getServiceScreen(String id);
  Future<ServicePostsScreen> getServicePostsScreen(String id);
}