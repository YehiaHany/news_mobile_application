import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news/model/news_response.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManger apiManger;
  NewsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<NewsResponse> getNews(String sourceId,int page) async {
    var response = await apiManger.getNews(sourceId,page);
    return response;
  }
}