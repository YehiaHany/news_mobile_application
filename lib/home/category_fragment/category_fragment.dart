import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/extensions/device_dimensions.dart';
import 'package:news/home/category_fragment/category_item.dart';
import 'package:news/model/category.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:news/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
typedef onCategoryItemClick = void Function(Category);
class CategoryFragment extends StatelessWidget {
  onCategoryItemClick selectedCategory;
  CategoryFragment({super.key,required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    var categoryList = Category.categoryList(isDark);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.calcOnWidth(8)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.newsGreeting.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  // behavior: HitTestBehavior.opaque,
                    onTap: (){
                        selectedCategory(categoryList[index]);
                    },
                    child: CategoryItem(category: categoryList[index], index: index));
              },
            ),
          ],
        ),
      ),
    );
  }
}
