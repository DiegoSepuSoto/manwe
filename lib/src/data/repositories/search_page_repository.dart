import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:manwe/src/domain/models/search_page.dart';
import 'package:manwe/src/domain/repositories/abstract_search_page_repository.dart';

class SearchPageRepository implements AbstractSearchPageRepository {

  @override
  Future<SearchPage> getSearchPage() async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/search";
      final response = await Dio().get(
        url,
      );
      final searchPage = SearchPage.fromJson(response.data);
      return searchPage;
    } catch (e) {
      throw Exception('Error loading search page');
    }
  }
}