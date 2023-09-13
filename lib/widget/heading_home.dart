import 'package:flutter/material.dart';

class HeadingHome extends StatelessWidget {
  const HeadingHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Welcome!",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "Find your favorite place in here",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
