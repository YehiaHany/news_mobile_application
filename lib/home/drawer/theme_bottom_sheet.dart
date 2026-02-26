import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/extensions/device_dimensions.dart';
import 'package:news/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import 'bottom_sheet_item.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.02,
        horizontal: context.width * 0.04,
      ),
      child: Column(
        spacing: context.height * 0.04,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BottomSheetItem(
            title: LocaleKeys.light.tr(),
            iconColor: isDark ? AppColors.transparentColor : null,
            onPressed: () {
              Navigator.of(context).pop();
              Future.delayed(Duration(milliseconds: 500),(){
                themeProvider.changeTheme(ThemeMode.light);
              });
            },
          ),
          BottomSheetItem(
            title: LocaleKeys.dark.tr(),
            iconColor: isDark ? null : AppColors.transparentColor,
            onPressed: () {
              Navigator.of(context).pop();
              Future.delayed(Duration(milliseconds: 500),(){
                themeProvider.changeTheme(ThemeMode.dark);
              });
            },
          ),
        ],
      ),
    );
  }
}
