import 'package:dio/dio.dart';
import 'package:news/api/api_constants.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    handler.next(err);
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    options.headers.addAll({'X-Api-Key': ApiConstants.apiKey});
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    handler.next(response);
  }
}

// class MyInterceptor extends InterceptorsWrapper{
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // TODO: implement onError
//     super.onError(err, handler);
//   }
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // TODO: implement onRequest
//     super.onRequest(options, handler);
//   }
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // TODO: implement onResponse
//     super.onResponse(response, handler);
//   }
// }
