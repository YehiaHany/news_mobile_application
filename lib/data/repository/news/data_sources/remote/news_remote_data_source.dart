import 'package:news/model/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNews(String sourceId, int page);
}