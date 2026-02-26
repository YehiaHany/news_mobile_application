import 'package:news/model/source_response.dart';

abstract class SourceState{}
class SourceSuccessState extends SourceState{
  List<Source> sourcesList;
  SourceSuccessState({required this.sourcesList});
}
class SourceErrorState extends SourceState{
  String errorMessage;
  SourceErrorState({required this.errorMessage});
}
class SourceLoadingState extends SourceState{}
