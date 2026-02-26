import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/model/news_response.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource dataSource;
  NewsRepositoryImpl({required this.dataSource});
  @override
  Future<NewsResponse> getNews(String sourceId) {
  return dataSource.getNews(sourceId);
  }
}