import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:manwe/src/domain/models/catalog_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_catalog_repository.dart';

class CatalogRepository implements AbstractCatalogRepository {

  @override
  Future<CatalogScreen> getCatalogScreen() async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/catalog";
      final response = await Dio().get(
        url,
      );
      final catalogScreen = CatalogScreen.fromJson(response.data);
      return catalogScreen;
    } catch (e) {
      throw Exception('Error loading catalog screen');
    }
  }
}