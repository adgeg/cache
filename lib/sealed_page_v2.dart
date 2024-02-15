import 'package:cache/content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeState state;

  const HomePage(this.state);

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      LoadingState _ => CircularProgressIndicator(),
      ErrorState error => Text(error.message),
      ContentState content => Content(content.data),
    };
  }
}





















sealed class HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  final String message;

  ErrorState(this.message);
}

class ContentState extends HomeState {
  final List<String> data;

  ContentState(this.data);
}



















