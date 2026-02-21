import 'package:easy_localization/easy_localization.dart';
import 'package:news/core/utils/app_assets.dart';
import 'package:news/translations/locale_keys.g.dart';

class Category {
  final String id;
  final String title;
  final String imagePath;
  const Category({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  static List<Category> categoryList (bool isDark){
    return [
      Category(
        id: "general",
        title: LocaleKeys.general.tr(),
        imagePath: fullImagePath(imgPath:AppAssets.generalImg ,isDark:isDark ),
      ),
      Category(
        id: "business",
        title: LocaleKeys.business.tr(),
        imagePath: fullImagePath(imgPath:AppAssets.busniessImg ,isDark:isDark ),
      ),
      Category(
        id: "sports",
        title: LocaleKeys.sports.tr(),
        imagePath: fullImagePath(imgPath:AppAssets.sportImg ,isDark:isDark ),
      ),
      Category(
        id: "technology",
        title: LocaleKeys.technology.tr(),
        imagePath: fullImagePath(imgPath:AppAssets.technologyImg ,isDark:isDark ),
      ),
      Category(
        id: "entertainment",
        title: LocaleKeys.entertainment.tr(),
        imagePath: fullImagePath(imgPath:AppAssets.entertainmentImg ,isDark:isDark ),
      ),
      Category(
        id: "health",
        title: LocaleKeys.health.tr(),
        imagePath: fullImagePath(imgPath:AppAssets.helthImg ,isDark:isDark ),
      ),
      Category(
        id: "science",
        title: LocaleKeys.science.tr(),
        imagePath: fullImagePath(imgPath:AppAssets.scienceImg ,isDark:isDark ),
      ),
    ];
  }
  static String fullImagePath({required String imgPath,required bool isDark}){
    var indexOfDot = imgPath.lastIndexOf('.');
    if(isDark){
      return imgPath;
    }
    else{
      return "${imgPath.substring(0,indexOfDot)}_dark${imgPath.substring(indexOfDot)}";

    }
  }
}
