import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final DisplayState state;

  const Page(this.state);

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      LoadingState _ => CircularProgressIndicator(),
      ErrorState error => Text(error.message),
      ContentState content => Image.network(content.imageUrl),
    };
  }
}

sealed class DisplayState {}

class LoadingState extends DisplayState {}

class ErrorState extends DisplayState {
  final String message;
  ErrorState(this.message);
}

class ContentState extends DisplayState {
  final String imageUrl;
  ContentState(this.imageUrl);
}
