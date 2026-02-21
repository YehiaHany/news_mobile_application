import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/home/sources/widget/source_tab.dart';
import 'package:news/model/source_response.dart';

class SourceWidget extends StatefulWidget {
  List<Source> sourcesList;

  SourceWidget({super.key, required this.sourcesList});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).splashColor,
            dividerColor: AppColors.transparentColor,
            tabAlignment: TabAlignment.start,
            onTap: (index){
              setState(() {
                selectedIndex = index;
              });
            },
            isScrollable: true,
            tabs:
                widget.sourcesList
                    .map(
                      (source) => SourceTab(source: source, isSelected: selectedIndex == widget.sourcesList.indexOf(source)),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
