import 'package:dio/dio.dart';
import 'package:getx_1/models/multi-topic.dart';
import 'package:getx_1/models/topic.dart';

import 'package:getx_1/routes/app.route.dart';
import 'package:getx_1/services/auth.services.dart';

class TopicApi {
  var dio = Dio();

  Future FetchTopic({required String categorySlug}) async {
    dio.options.baseUrl = APIRoutes.BaseURL;
    dio.interceptors
      ..add(LogInterceptor())
      ..add(AuthInterceptor());

    final String subURL = '/forum/topics/';
    try {
      final response = await dio
          .get(subURL, queryParameters: {'categorySlug': categorySlug});
      final statusCode = response.statusCode;
      final body = response.data;

      if (statusCode == 200) {
        return Topics.fromJson(body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future getTopic({required String slugid}) async {
    dio.options.baseUrl = APIRoutes.BaseURL;
    dio.interceptors
      ..add(LogInterceptor())
      ..add(AuthInterceptor());

    final String subURL = '/forum/topics/';

    try {
      final response = await dio.get(subURL + slugid);
      final statusCode = response.statusCode;
      final body = response.data;

      if (statusCode == 200) {
        return Topic.fromJson(body);
      }
    } catch (e) {
      // print(e);
    }
  }

  Future createTopic(
      {required Object category,
      required String topicSubject,
      required String topicDetail,
      required String topicBy,
      required Object tags}) async {
    dio.options.baseUrl = APIRoutes.BaseURL;
    dio.interceptors
      ..add(LogInterceptor())
      ..add(AuthInterceptor());

    final String subURL = '/forum/topics/';
    try {
      final response = await dio.post(subURL, data: {
        'category': category,
        'topicSubject': topicSubject,
        'topicDetail': topicDetail,
        'topicBy': topicBy,
        'tags': tags
      });
      final statusCode = response.statusCode;
      final body = response.data;
      if (statusCode == 200) {
        print(body);
      }
    } catch (e) {
      print(e);
    }
  }
}
