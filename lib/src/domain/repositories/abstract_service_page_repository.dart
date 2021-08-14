import 'package:manwe/src/domain/models/service_page.dart';

abstract class AbstractServicePageRepository {
  Future<ServicePage> getServicePage(String id);
}