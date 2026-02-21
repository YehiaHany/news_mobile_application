import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/home/sources/source_widget.dart';
import 'package:news/home/widgets/main_error_widget.dart';
import 'package:news/home/widgets/main_loading_widget.dart';
import 'package:news/model/source_response.dart';
import 'package:news/translations/locale_keys.g.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManger.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: LocaleKeys.somethingWentWrong.tr(),
            onPressed: () {
              ApiManger.getSources();
              setState(() {});
            },
          );;
        }

        /// server => response => success , error
        if (snapshot.data?.status != "ok") {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManger.getSources();
              setState(() {});
            },
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return SourceWidget(sourcesList: sourcesList);
        ;
      },
    );
  }
}
