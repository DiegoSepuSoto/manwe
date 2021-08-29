import 'package:manwe/src/domain/models/search_screen.dart';

abstract class AbstractSearchRepository {
  Future<SearchScreen> getSearchScreen();
}