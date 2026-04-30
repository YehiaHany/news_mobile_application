import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di.dart';
import 'package:news/home/news/cubit/news_state.dart';
import 'package:news/home/news/cubit/news_view_model.dart';
import 'package:news/home/news/news_item.dart';
import '../../model/source_response.dart';
import '../../translations/locale_keys.g.dart';
import '../widgets/main_error_widget.dart';
import '../widgets/main_loading_widget.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel(
    newsRepository: injectNewsRepository(),
  );
  int currentPage = 1;
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(
      sourceId: widget.source.id ?? "",
      page: currentPage,
    );
    _controller.addListener((){
      if(_controller.position.pixels!=0 && _controller.position.atEdge){
        currentPage++;
        viewModel.getNewsBySourceId(
          sourceId: widget.source.id ?? "",
          page: currentPage,
        );
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      currentPage = 1;
      viewModel.getNewsBySourceId(
        sourceId: widget.source.id ?? "",
        page: currentPage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsSuccessState) {
          var newsList = viewModel.newsList ?? [];
          return newsList.isEmpty
              ? Center(
                child: Text(
                  LocaleKeys.noAvailableNews.tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
              )
              : ListView.builder(
                controller: _controller,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if(index <newsList.length) {
                    return NewsItem(news: newsList[index]);
                  }
                  else{
                    return Container(
                        color: Colors.red,
                        child: SizedBox(height: 100,));
                  }
                },
                itemCount: newsList.length+1,
              );
        } else if (state is NewsErrorState) {
          return MainErrorWidget(
            errorMessage: viewModel.errorMessage!,
            onPressed: () {
              viewModel.getNewsBySourceId(
                sourceId: widget.source.id ?? "",
                page: currentPage,
              );
              setState(() {});
            },
          );
        } else {
          return MainLoadingWidget();
        }
      },
    );
  }
}
