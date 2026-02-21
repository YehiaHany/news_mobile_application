import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/extensions/device_dimensions.dart';

class SelectedItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const SelectedItem({super.key,required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.calcOnWidth(10),vertical: context.calcOnHeight(10)),
        margin: EdgeInsets.only(left:context.calcOnWidth(7) ,right: context.calcOnWidth(7),top:context.calcOnHeight(8) ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.white,
            width: 1
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: AppStyles.medium20White,),
            Icon(Icons.arrow_drop_down_rounded,size: 35,color: AppColors.white,)
          ],
        ),
      ),
    );
  }
}
