import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
import 'package:news/home/category_details/cubit/source_state.dart';

class SourceViewModel extends Cubit<SourceState>{
  SourceRepository sourceRepository;
  SourceViewModel({required this.sourceRepository}):super(SourceLoadingState());
  
  Future<void> getSources({required String categoryId}) async {
    try{
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId: categoryId);
      if(response.status == 'error'){
        emit(SourceErrorState(errorMessage: response.message!));
      }
      if(response.status == 'ok'){
        emit(SourceSuccessState(sourcesList: response.sources!));
      }
    }
    catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

}