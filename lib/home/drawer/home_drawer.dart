import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/extensions/device_dimensions.dart';
import 'package:news/home/drawer/divider_item.dart';
import 'package:news/home/drawer/drawer_item.dart';
import 'package:news/home/drawer/language_bottom_sheet.dart';
import 'package:news/home/drawer/selected_item.dart';
import 'package:news/home/drawer/theme_bottom_sheet.dart';
import 'package:news/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_assets.dart';
import '../../providers/theme_provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    bool isEnglish = context.locale.languageCode == "en";
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: context.calcOnHeight(16)),
            height: context.calcOnHeight(166),
            color: AppColors.white,
            alignment: Alignment.center,
            child: Text(LocaleKeys.newsApp.tr(), style: AppStyles.bold24Black),
          ),
          DrawerItem(
            title: LocaleKeys.goToHome.tr(),
            imagePath: AppAssets.homeIcon,
          ),
          DividerItem(),
          DrawerItem(
            title: LocaleKeys.theme.tr(),
            imagePath: AppAssets.themeIcon,
          ),
          SelectedItem(
            title: isDark ? LocaleKeys.dark.tr() : LocaleKeys.light.tr(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ThemeBottomSheet(),
              );
            },
          ),
          DividerItem(),
          DrawerItem(
            title: LocaleKeys.language.tr(),
            imagePath: AppAssets.languageIcon,
          ),
          SelectedItem(
            title: isEnglish ? LocaleKeys.english.tr() : LocaleKeys.arabic.tr(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => LanguageBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
