import 'package:cache/content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomePage(this.viewModel);

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return CircularProgressIndicator();
    } else if (viewModel.errorMessage != null) {
      return Text(viewModel.errorMessage!);
    } else if (viewModel.data != null) {
      return Content(viewModel.data!);
    } else {
      return SizedBox.shrink(); // Impossible
    }
  }
}




























class HomeViewModel {
  final bool isLoading;
  final String? errorMessage;
  final List<String>? data;

  HomeViewModel({
    required this.isLoading,
    required this.errorMessage,
    required this.data,
  });
}































