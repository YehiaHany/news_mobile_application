// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "home": "الرئيسية",
  "tryAgain": "حاول مجددا",
  "somethingWentWrong": "حدث خطأ ما",
  "by": "بواسطة",
  "noAvailableNews": "لا يوجد اخبار متاحة الأن من هذا المصدر",
  "business": "الأعمال",
  "entertainment": "الترفيه",
  "general": "عام",
  "health": "الصحة",
  "science": "العلوم",
  "sports": "الرياضة",
  "technology": "التكنولوجيا",
  "newsGreeting": "صباح الخير\nإليك بعض الأخبار",
  "viewAll": "اعرض الجميع",
  "newsApp": "تطبيق الأخبار",
  "goToHome": "الذهاب إلى الرئيسية",
  "theme": "المظهر",
  "language": "اللغة",
  "dark": "داكن",
  "light": "فاتح",
  "english": "الإنجليزية",
  "arabic": "العربية",
  "changeLanguage": "غير اللفة"
};
static const Map<String,dynamic> _en = {
  "home": "Home",
  "tryAgain": "Try Again",
  "somethingWentWrong": "Something Went Wrong",
  "by": "By",
  "noAvailableNews": "There is now available news right now from this source",
  "business": "Business",
  "entertainment": "Entertainment",
  "general": "General",
  "health": "Health",
  "science": "Science",
  "sports": "Sports",
  "technology": "Technology",
  "newsGreeting": "Good Morning\nHere is Some News For You",
  "viewAll": "View All",
  "newsApp": "News App",
  "goToHome": "Go To Home",
  "theme": "Theme",
  "language": "Language",
  "dark": "Dark",
  "light": "Light",
  "english": "English",
  "arabic": "Arabic",
  "changeLanguage": "Change Language"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
