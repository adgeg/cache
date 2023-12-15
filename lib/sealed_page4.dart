import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final ViewModel viewModel;

  const Page(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return switch (viewModel) {
      Loading _ => CircularProgressIndicator(),
      Error error => Text(error.message),
      Success success => Content(success.data),
    };
  }
}

sealed class ViewModel {}

class Loading extends ViewModel {}

class Error extends ViewModel {
  final String message;
  Error(this.message);
}

class Success extends ViewModel {
  final List<String> data;
  Success(this.data);
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
