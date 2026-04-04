import 'package:flutter/material.dart';

import '../../../model/source_response.dart';

class SourceTab extends StatelessWidget {
  final Source source;
  final bool isSelected;
   SourceTab({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name??"",style: isSelected?Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.labelMedium,);
  }
}
