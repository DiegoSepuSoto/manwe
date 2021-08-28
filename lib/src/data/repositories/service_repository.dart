import 'package:manwe/src/domain/models/service_page.dart';
import 'package:manwe/src/domain/models/service_posts_page.dart';
import 'package:manwe/src/domain/repositories/abstract_service_page_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class ServiceRepository implements AbstractServiceRepository {

  Future<ServicePage> getServicePage(String id) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/service/" + id;
      final response = await Dio().get(
        url,
      );
      final servicePage = ServicePage.fromJson(response.data);
      return servicePage;
    } catch (e) {
      throw Exception('Error loading service page');
    }
  }

  Future<ServicePostsPage> getServicePosts(String id) async {
    try {
      final url = "${dotenv.env['ELENTARI_HOST']}/v1/service/" + id + "/posts";
      final response = await Dio().get(
        url,
      );
      final servicePostsPage = ServicePostsPage.fromJson(response.data);
      return servicePostsPage;
    } catch (e) {
      throw Exception('Error loading service page');
    }
  }
}