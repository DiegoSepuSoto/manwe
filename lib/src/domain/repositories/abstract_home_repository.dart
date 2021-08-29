import 'package:manwe/src/domain/models/home_screen.dart';

abstract class AbstractHomeRepository {
  Future<HomeScreen> getHomeScreen();
}