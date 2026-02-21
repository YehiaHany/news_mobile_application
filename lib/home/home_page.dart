import 'package:flutter/material.dart';
import 'package:news/home/category_details/category_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: CategoryDetails(),
    );
  }
}
