import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/extensions/device_dimensions.dart';
import 'package:news/translations/locale_keys.g.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/news_response.dart';
class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.calcOnWidth(8),vertical: context.calcOnHeight(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).splashColor,
          width: 2
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Column(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage??"",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(news.title??"",style: Theme.of(context).textTheme.labelLarge,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(child: Text("${LocaleKeys.by.tr()} : ${news.author??""}",style: Theme.of(context).textTheme.labelSmall,)),
              Text(formatTimeAgo(news.publishedAt??"", context.locale.languageCode),style: Theme.of(context).textTheme.labelSmall),
          ],)
        ],
      ),
    );
  }
  String formatTimeAgo(String publishedAt,String localCode){
    if(publishedAt.trim().isEmpty){
      return "";
    }
    final dateTime = DateTime.parse(publishedAt).toLocal();
    return timeago.format(dateTime,locale: localCode);
  }
}
