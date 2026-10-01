import 'package:dio/dio.dart';
import 'package:news/api/api_constants.dart';
import 'package:news/api/dio/dio_interceptors.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../model/news_response.dart';

class DioManger {
  static final Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org",

        /// making the api key from the basics
        // queryParameters: {'apiKey': ApiConstants.apiKey},
        /// if we use validate state to be always true it will never throw an exception and we can handle the exceptions inside the try
        // validateStatus: (status) {
        //   return status != null && status < 500; or return true;
        // },
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),

        /// inserting the api key in the header no as query parameter
        // headers: {'X-Api-Key': ApiConstants.apiKey},
      ),
    )
    ..interceptors.addAll([
      DioInterceptor(),
      // PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseBody: true,
      //   responseHeader: false,
      //   error: true,
      // ),
    ]);
  DioManger() {
    /// logInInterceptor Example
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

      /// this way is used if there is no exceptions happen and we used validateStatus in base options
      /// ----------------------------------------------------------
      // if(response.statusCode == 401){}
      // if (response.data['status'] == "error"){
      //   print("here111**:${response.data['message']??'Server Error'}");
      //   throw Exception(response.data['message']??'Server Error');
      // }
      // else{
      //   return SourceResponse.fromJson(json);
      // }
      ///-------------------------------------------------------------
      return SourceResponse.fromJson(json);
    } on DioException catch (e) {
      // final exception = DioException.connectionTimeout(
      //   timeout: const Duration(seconds: 5),
      //   requestOptions: RequestOptions(
      //     path: '/news',
      //   ),
      // );
      ///this method if we want to check returned data type is a map for example
      ///----------------------------------------------------------------------------
      // final data = e.response?.data;
      // throw Exception(
      //   data is Map<String, dynamic> ? data['message']  : e.message,
      // );
      ///----------------------------------------------------------------------------
      // throw Exception(
      //   e.response?.data?['message'] ?? e.message,
      // );
      ///pretty description from dio extension
      throw Exception(e.type.toPrettyDescription(),);

      ///filtering exceptions manually and presenting humanized messages to users
      ///----------------------------------------------------------------------------
      // final errorMsg = _handleDioError(e);
      // final statusCode = e.response?.statusCode;
      // throw Exception("$statusCode $errorMsg");
      /// if i want to remove the word exception when using the custom way to filter exceptions
      // throw CustomException("Error $statusCode: $errorMsg");
      ///----------------------------------------------------------------------------
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

  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connection timed out";

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;

        switch (statusCode) {
          case 400:
            return "Bad Request";

          case 401:
            return "Unauthorized";

          case 403:
            return "Forbidden";

          case 404:
            return "Not Found";

          case 409:
            return "Conflict";

          case 500:
            return "Internal Server Error";

          default:
            return "Something went wrong";
        }

      case DioExceptionType.cancel:
        return "Request was cancelled";

      case DioExceptionType.connectionError:
        return "No Internet Connection";

      case DioExceptionType.badCertificate:
        return "Invalid SSL certificate";

      case DioExceptionType.unknown:
        return "Something went wrong";
    }
  }



}
extension DioExceptionTypeExtension on DioExceptionType {
  String toPrettyDescription() {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';

      case DioExceptionType.sendTimeout:
        return 'Send timeout';

      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';

      case DioExceptionType.badCertificate:
        return 'Invalid SSL certificate';

      case DioExceptionType.badResponse:
        return 'Bad response from server';

      case DioExceptionType.cancel:
        return 'Request was cancelled';

      case DioExceptionType.connectionError:
        return 'No internet connection';

      case DioExceptionType.unknown:
        return 'Something went wrong';
    }
  }
}
class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => message;
}
