import 'package:flutter/material.dart';
import 'package:tourism_app/app/widget/logo_widget.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/theme/widget/theme_toggle.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingView();
  }
}

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.titleMedium;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      children: [
        TextWidget.heading('Preferences', style: headingStyle),
        const ThemeToggle(),
        TextWidget.heading('About', style: headingStyle),
        ListTile(
          title: const TextWidget('Source Code'),
          subtitle: const TextWidget('View the full source code on GitHub'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => launchUrlString(
            'https://github.com/achmadilham07/tourism_app',
          ),
        ),
        ListTile(
          title: const TextWidget('Licenses'),
          subtitle: const TextWidget('View the licenses of the libraries used'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => showLicensePage(
            context: context,
            applicationIcon: const LogoWidget(height: 120),
            applicationName: 'Tourism App',
          ),
        ),
      ],
    );
  }
}
