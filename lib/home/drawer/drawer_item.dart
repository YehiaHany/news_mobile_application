import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/utils/app_assets.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/extensions/device_dimensions.dart';
import 'package:news/translations/locale_keys.g.dart';

class DrawerItem extends StatelessWidget {
  final String imagePath;
  final String title;
  const DrawerItem({super.key,required this.title,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(
        start: context.calcOnWidth(7)
      ),
      child: Row(
        spacing: context.calcOnWidth(10.5),
        children: [
          SvgPicture.asset(imagePath),
          Text(title,style: AppStyles.bold20White,),
        ],
      ),
    );
  }
}
