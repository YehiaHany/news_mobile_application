import 'package:news/api/api_manger.dart';
import 'package:news/api/dio/dio_manger.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/model/source_response.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManger apiManger;
  SourceRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<SourceResponse> getSources(String categoryId) async {
    // var sourceResponse = await apiManger.getSources(categoryId: categoryId);
    var sourceResponse = await DioManger.getSources(categoryId: categoryId);
    return sourceResponse;
  }
}