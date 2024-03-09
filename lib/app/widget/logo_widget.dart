import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.height = kToolbarHeight,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    // TODO: Fix me later using Selector
    const logo = 'assets/logo.png';
    return Image.asset(logo, height: height);
  }
}
