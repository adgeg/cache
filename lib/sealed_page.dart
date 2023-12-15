import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final DisplayState state;

  const Page(this.state);

  @override
  Widget build(BuildContext context) {
    if (state is LoadingState) {
      return CircularProgressIndicator();
    } else if (state is ErrorState) {
      return Text((state as ErrorState).message);
    } else if (state is ContentState) {
      return Image.network((state as ContentState).imageUrl);
    } else {
      return SizedBox.shrink(); // Should never happen
    }
  }
}

class DisplayState {}

class LoadingState extends DisplayState {}

class ErrorState extends DisplayState {
  final String message;
  ErrorState(this.message);
}

class ContentState extends DisplayState {
  final String imageUrl;
  ContentState(this.imageUrl);
}
