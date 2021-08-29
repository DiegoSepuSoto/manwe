import 'package:manwe/src/domain/models/service_screen.dart';
import 'package:manwe/src/domain/models/service_posts_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_service_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class ServiceRepository implements AbstractServiceRepository {

  Future<ServiceScreen> getServiceScreen(String id) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/service/" + id;
      final response = await Dio().get(
        url,
      );
      final serviceScreen = ServiceScreen.fromJson(response.data);
      return serviceScreen;
    } catch (e) {
      throw Exception('Error loading service screen');
    }
  }

  Future<ServicePostsScreen> getServicePostsScreen(String id) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/service/" + id + "/posts";
      final response = await Dio().get(
        url,
      );
      final servicePostsScreen = ServicePostsScreen.fromJson(response.data);
      return servicePostsScreen;
    } catch (e) {
      throw Exception('Error loading service posts screen');
    }
  }
}