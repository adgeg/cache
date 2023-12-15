import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final ViewModel viewModel;

  const Page(this.viewModel);

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return CircularProgressIndicator();
    } else if (viewModel.errorMessage != null) {
      return Text(viewModel.errorMessage!);
    } else if (viewModel.data != null) {
      return Content(viewModel.data!);
    } else {
      return SizedBox.shrink(); // Should never happen
    }
  }
}

class ViewModel {
  final bool isLoading;
  final String? errorMessage;
  final List<String>? data;

  ViewModel({
    required this.isLoading,
    required this.errorMessage,
    required this.data,
  });
}

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
