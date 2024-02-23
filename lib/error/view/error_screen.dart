import 'package:flutter/material.dart';
import 'package:tourism_app/app/widget/text_widget.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.message = "",
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final heading = theme.textTheme.headlineMedium;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            message,
            style: heading,
          ),
        ],
      ),
    );
  }
}
