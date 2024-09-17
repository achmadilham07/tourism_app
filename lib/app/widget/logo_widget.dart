import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/theme/cubit/theme_cubit.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.height = kToolbarHeight,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    // TODO: Fix me later using Selector
    final logo = context.select(
      (ThemeCubit cubit) =>
          cubit.state.isLight ? 'assets/logo.png' : 'assets/logo-white.png',
    );
    return Image.asset(logo, height: height);
  }
}
