import 'package:manwe/src/domain/models/search_page.dart';

abstract class AbstractSearchPageRepository {
  Future<SearchPage> getSearchPage();
}