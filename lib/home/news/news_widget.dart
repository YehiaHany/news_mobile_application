import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/model/news_response.dart';

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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManger.getNews(widget.source.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: LocaleKeys.somethingWentWrong.tr(),
            onPressed: () {
              ApiManger.getNews(widget.source.id ?? "");
              setState(() {});
            },
          );
        }

        if (snapshot.data?.status == "error") {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManger.getNews(widget.source.id ?? "");
              setState(() {});
            },
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return newsList.isEmpty
            ? Center(child:Text(LocaleKeys.noAvailableNews.tr(),style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),)
            : ListView.builder(
              itemBuilder: (context, index) => NewsItem(news: newsList[index]),
              itemCount: newsList.length,
            );
      },
    );
  }
}
