import 'package:manwe/src/domain/models/home_page.dart';

abstract class AbstractHomePageRepository {
  Future<HomePage> getHomePage();
}