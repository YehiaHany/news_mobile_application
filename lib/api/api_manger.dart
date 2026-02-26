import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/news_response.dart';
import 'package:news/model/source_response.dart';

class ApiManger{
  static Future<SourceResponse> getSources({required String categoryId}) async {
    Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.sourceApi,{
      "apiKey": ApiConstants.apiKey,
      "category":categoryId,
    });
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      /// String => json
      var json = jsonDecode(responseBody);
      /// json => object
      return SourceResponse.fromJson(json);
    }
    catch(e){
      rethrow;
    }
  }
  static Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.newsApi,{
      "apiKey": ApiConstants.apiKey,
      "sources":sourceId
    });
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      ///String=>json
      var jsonBody = jsonDecode(responseBody);
      ///json=>object
      return NewsResponse.fromJson(jsonBody);
    }
    catch(e){
      rethrow;
    }
  }
}