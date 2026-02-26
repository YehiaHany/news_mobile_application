import 'package:news/data/repository/sources/repository/source_repository.dart';
import 'package:news/model/source_response.dart';
import '../../data_sources/remote/source_remote_data_source.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse> getSources({required String categoryId}) {
    return remoteDataSource.getSources(categoryId);

  }

  
}