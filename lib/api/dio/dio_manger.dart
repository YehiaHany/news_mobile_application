import 'package:dio/dio.dart';
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../model/news_response.dart';

class DioManger {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org",
      queryParameters: {'apiKey': ApiConstants.apiKey},
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      // headers: {'X-Api-Key': ApiConstants.apiKey},
    ),
  );
  // Dio()
  //   ..interceptors.add(
  //     LogInterceptor(
  //       request: true,
  //       requestBody: true,
  //       requestHeader: true,
  //       responseBody: true,
  //       responseHeader: true,
  //     ),
  //   );
  // Methode 2
  DioManger() {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
  }
  static Future<SourceResponse> getSources({required String categoryId}) async {
    try {
      var response = await dio.get(
        EndPoints.sourceApi,
        queryParameters: {'category': categoryId},
      );
      var json = response.data;
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNews(String sourceId, int page) async {
    try {
      var response = await dio.get(
        EndPoints.newsApi,
        queryParameters: {
          "sources": sourceId,
          "page": "$page",
          "pageSize": "10",
        },
      );
      var json = response.data;
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
