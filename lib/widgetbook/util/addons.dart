import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/theme/cubit/theme_cubit.dart';
import 'package:tourism_app/theme/theme.dart';
import 'package:tourism_app/widgetbook/widgetbook.dart';

final addons = <WidgetbookAddon>[
  ThemeAddon<ThemeState>(
    themes: const [
      WidgetbookTheme(
        name: 'Light',
        data: ThemeState.light,
      ),
      WidgetbookTheme(
        name: 'Dark',
        data: ThemeState.dark,
      ),
    ],
    initialTheme: const WidgetbookTheme(
      name: 'Light',
      data: ThemeState.light,
    ),
    themeBuilder: (context, theme, child) {
      return BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          if (theme != themeState) {
            context.read<ThemeCubit>().toggle(theme);
          }
          return Theme(
            data: theme.isLight ? lightTheme : darkTheme,
            child: child,
          );
        },
      );
    },
  ),
  TextScaleAddon(
    scales: [1.0, 1.5, 2.0],
  ),
  DeviceFrameAddon(
    devices: [
      Devices.ios.iPhoneSE,
      Devices.android.samsungGalaxyA50,
      Devices.windows.laptop,
      Devices.macOS.macBookPro,
      Devices.linux.wideMonitor,
    ],
  ),
  BuilderAddon(
    name: 'builder',
    builder: (context, child) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: child,
          ),
        ),
      );
    },
  ),
];
