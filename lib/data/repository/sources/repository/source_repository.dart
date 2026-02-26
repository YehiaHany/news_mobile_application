import 'package:news/model/source_response.dart';

/// interface => source repository

abstract class SourceRepository{
  Future<SourceResponse> getSources({required String categoryId});
}