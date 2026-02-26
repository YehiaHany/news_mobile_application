// sourceView => object SourceViewModel
// SourceViewModel => object SourceRepository
// SourceRepository => object SourceRemoteDataSource
// SourceRemoteDataSource => object ApiManger

import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';

SourceRepository injectSourceRepository(){
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());
}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManger: injectApiManger());
}
ApiManger injectApiManger(){
  return ApiManger();
}

NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl(dataSource: injectNewsRepositoryDataSource());
}
NewsRemoteDataSource injectNewsRepositoryDataSource(){
  return NewsRemoteDataSourceImpl(apiManger: injectApiManger());
}
