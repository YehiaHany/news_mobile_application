import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/di.dart';
import 'package:news/home/category_details/cubit/sourceViewModel.dart';
import 'package:news/home/category_details/cubit/source_state.dart';
import 'package:news/home/sources/source_widget.dart';
import 'package:news/home/widgets/main_error_widget.dart';
import 'package:news/home/widgets/main_loading_widget.dart';
import 'package:news/model/category.dart';
import 'package:news/model/source_response.dart';
import 'package:news/translations/locale_keys.g.dart';

class CategoryDetails extends StatefulWidget {
  final String selectedCategoryId;
  const CategoryDetails({super.key, required this.selectedCategoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel = SourceViewModel(sourceRepository: injectSourceRepository());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(categoryId: widget.selectedCategoryId);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModel, SourceState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceSuccessState) {
          var sourcesList = state.sourcesList;
          return SourceWidget(sourcesList: sourcesList);
        } else if (state is SourceErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage,
            onPressed: () {
              viewModel.getSources(categoryId: widget.selectedCategoryId);
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
