import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/home/news/cubit/news_state.dart';
import 'package:news/model/news_response.dart';

class NewsViewModel extends Cubit<NewsState>{
  NewsRepository newsRepository;
  NewsViewModel({required this.newsRepository}):super(NewsLoadingState());
  String? errorMessage;
  List<News>? newsList;
  Future<void> getNewsBySourceId({required String sourceId,required int page}) async {
    try{
      if(page == 1) {
        emit(NewsLoadingState());
      }
      var response = await newsRepository.getNews(sourceId,page);
      if(response.status == "error"){
        errorMessage = response.message;
        emit(NewsErrorState());
        return;
      }
      if(response.status == "ok"){
          if(page == 1) {
            newsList = response.articles;
          }
          else{
            newsList?.addAll(response.articles ?? []);
          }
          emit(NewsSuccessState());
      }
    }
    catch(e){
      errorMessage = e.toString();
      emit(NewsErrorState());
    }
  }
}