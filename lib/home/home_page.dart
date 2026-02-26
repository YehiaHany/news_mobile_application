import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/home/category_details/category_details.dart';
import 'package:news/home/category_fragment/category_fragment.dart';
import 'package:news/model/category.dart';
import 'package:news/translations/locale_keys.g.dart';
import 'drawer/home_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory!=null?selectedCategory!.id.tr():LocaleKeys.home.tr()),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.black,
        child: HomeDrawer(goToHome: unSetCategory,),
      ),
      body: selectedCategory == null?CategoryFragment(selectedCategory:setCategory,):CategoryDetails(selectedCategoryId: selectedCategory!.id,),
    );
  }

  Category? selectedCategory;

  void setCategory(Category category){
    setState(() {
      selectedCategory = category;
    });
  }
  void unSetCategory(){
    setState(() {
      selectedCategory = null;
    });
  }
}
