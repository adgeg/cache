import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final List<String> children;

  const Content(this.children);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) {
        return Text(children[index]);
      },
    );
  }
}
