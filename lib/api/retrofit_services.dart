import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news/api/end_points.dart';
import 'package:news/api/model/news/news_respone.dart';
import 'package:news/api/model/sources/source_response.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_services.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class RetrofitServices {
  factory RetrofitServices(Dio dio, {String? baseUrl}) = _RetrofitServices;

  @GET(EndPoints.sourceApi)
  Future<SourceResponse> getSources(
    @Query('apikey') String apiKey,
    @Query('category') String categoryId,
  );
  @GET(EndPoints.newsApi)
  Future<NewsResponse> getNewsBySourceId(
      @Query('apikey') String apiKey,
      @Query('sources') String sourceId,
      );
}
