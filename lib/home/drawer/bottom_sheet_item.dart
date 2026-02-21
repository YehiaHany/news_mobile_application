
import 'package:flutter/material.dart';

class BottomSheetItem extends StatelessWidget {
  final String title;
  Color? iconColor;
  VoidCallback onPressed;
  BottomSheetItem({super.key,required this.title,required this.iconColor,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: Theme.of(context).textTheme.headlineLarge,),
          Icon(Icons.check_rounded,color: iconColor,),
        ],
      ),
    );
  }
}
