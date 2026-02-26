import 'package:news/model/source_response.dart';

/// interface => source remote data source

abstract class SourceRemoteDataSource{
  Future<SourceResponse>getSources(String categoryId);
}