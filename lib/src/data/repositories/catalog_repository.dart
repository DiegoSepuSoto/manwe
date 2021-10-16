import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:manwe/src/domain/models/catalog_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_catalog_repository.dart';
import 'package:manwe/src/shared/interceptors.dart';
import 'package:manwe/src/shared/user_preferences.dart';

class CatalogRepository implements AbstractCatalogRepository {

  @override
  Future<CatalogScreen> getCatalogScreen() async {
    try {
      Dio _client = new Dio();

      final userInfo = UserPreferences.getUserInfo();
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/catalog";
      _client.options.headers["Authorization"] = "Bearer ${userInfo.token}";
      _client.interceptors.add(unauthorizedInterceptor(_client));

      final response = await _client.get(url);

      final catalogScreen = CatalogScreen.fromJson(response.data);
      return catalogScreen;
    } catch (e) {
      throw Exception('Error loading catalog screen');
    }
  }
}