import 'package:manwe/src/domain/models/catalog_screen.dart';

abstract class AbstractCatalogRepository {
  Future<CatalogScreen> getCatalogScreen();
}