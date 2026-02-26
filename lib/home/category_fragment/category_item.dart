import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/extensions/device_dimensions.dart';
import 'package:news/model/category.dart';
import 'package:news/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import '../../providers/theme_provider.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;
  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    bool isEnglish = context.locale.languageCode == "en";
    bool isEven = index % 2 == 0;
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.calcOnHeight(8)),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        alignment:
            isEven
                ? AlignmentDirectional.topEnd
                : AlignmentDirectional.topStart,
        children: [
          Image.asset(category.imagePath),
          Positioned(
            top: 35,
            left: isEven ? null : context.calcOnWidth(20),
            right:
                isEven
                    ? context.calcOnWidth(
                      category.title == "Entertainment" ? 5 : 60,
                    )
                    : null,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Positioned(
            bottom: 16,
            left: isEven ? null : context.calcOnWidth(16),
            right: isEven ? context.calcOnWidth(16) : null,
            child: Container(
              padding: EdgeInsetsDirectional.only(
                start: isEven ? context.calcOnWidth(16) : 0,
                end: isEven ? 0 : context.calcOnWidth(16),
              ),
              decoration: BoxDecoration(
                color:
                    isDark
                        ? AppColors.black.withValues(alpha: 0.5)
                        : AppColors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(84),
              ),
              child: Row(
                textDirection:
                    isEnglish?isEven ? ui.TextDirection.ltr : ui.TextDirection.rtl:isEven ? ui.TextDirection.rtl : ui.TextDirection.ltr,
                spacing: context.calcOnWidth(10),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.viewAll.tr(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: isDark ? AppColors.black : AppColors.white,
                    child: Icon(
                      isEven
                          ? Icons.arrow_forward_ios_rounded
                          : Icons.arrow_back_ios_rounded,
                      color: isDark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
