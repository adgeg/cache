import 'package:cache/resolution_repository.dart';
import 'package:flutter/material.dart';

class ResolutionListPage extends StatelessWidget {
  final List<Resolution> resolutions = NewYearRepository().getResolutions();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resolutions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(resolutions[index].icon),
          title: Text(resolutions[index].title),
        );
      },
    );
  }
}
