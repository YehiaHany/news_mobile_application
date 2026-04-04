import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/extensions/device_dimensions.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.calcOnHeight(18)),
      child: Divider(
        color: AppColors.white,
        thickness: 1,
        indent: context.calcOnWidth(6),
        endIndent: context.calcOnWidth(16),
      ),
    );
  }
}
