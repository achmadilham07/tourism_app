import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/theme/cubit/theme_cubit.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeCubit>().state;
    final label = state.isLight ? 'Light Mode' : 'Dark Mode';
    final icon = state.isLight ? Icons.light_mode : Icons.dark_mode;
    return SwitchListTile(
      title: TextWidget(label),
      value: state.isLight,
      onChanged: (_) => context.read<ThemeCubit>().toggle(),
      secondary: Icon(icon),
    );
  }
}
