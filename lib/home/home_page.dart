import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/home/category_fragment/category_fragment.dart';
import 'package:news/translations/locale_keys.g.dart';

import 'drawer/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr()),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.black,
        child: HomeDrawer(
        ),
      ),
      body: CategoryFragment(),
    );
  }
}
