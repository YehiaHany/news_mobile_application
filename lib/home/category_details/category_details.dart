import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/model/source_response.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManger.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Column(
            spacing: 10,
            children: [
              Text("Something went wrong "),
              ElevatedButton(onPressed: () {}, child: Text("Try again")),
            ],
          );
        }

        /// server => response => success , error
        if (snapshot.data?.status != "ok") {
          return Column(
            spacing: 10,
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: () {}, child: Text("Try again")),
            ],
          );
        }
        var sourceList = snapshot.data?.sources ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return Text(sourceList[index].name ?? "");
          },
          itemCount: sourceList.length,
        );
      },
    );
  }
}
