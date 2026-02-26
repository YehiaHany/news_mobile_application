import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/extensions/device_dimensions.dart';
import 'package:news/translations/locale_keys.g.dart';
import 'bottom_sheet_item.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale.languageCode == "en";
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
            title: LocaleKeys.english.tr(),
            iconColor: isEnglish ? null : AppColors.transparentColor,
            onPressed: ()  {
              context.setLocale(Locale("en"));

            },
          ),
          BottomSheetItem(
            title: LocaleKeys.arabic.tr(),
            iconColor: isEnglish ? AppColors.transparentColor : null,
            onPressed: ()  {
              context.setLocale(Locale("ar"));
            },
          ),
        ],
      ),
    );
  }
}
