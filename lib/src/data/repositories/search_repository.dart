import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:manwe/src/domain/models/search_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_search_repository.dart';

class SearchRepository implements AbstractSearchRepository {

  @override
  Future<SearchScreen> getSearchScreen() async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/search";
      final response = await Dio().get(
        url,
      );
      final searchScreen = SearchScreen.fromJson(response.data);
      return searchScreen;
    } catch (e) {
      throw Exception('Error loading search screen');
    }
  }
}