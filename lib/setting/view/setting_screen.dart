import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tourism_app/app/widget/logo_widget.dart';
import 'package:tourism_app/app/widget/responsive_view.dart';
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
    final scrollController = ScrollController();
    return ResponsiveView(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          TextWidget.heading('Preferences', style: headingStyle),
          const ThemeToggle(),
          TextWidget.heading('About', style: headingStyle),
          const ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [TextWidget('Version'), AppVersion()],
            ),
          ),
          ListTile(
            title: const TextWidget('Source Code'),
            subtitle: const TextWidget('View the full source code on GitHub'),
            trailing: const FaIcon(Icons.chevron_right),
            onTap: () => launchUrlString(
              'https://github.com/achmadilham07/tourism_app',
            ),
          ),
          ListTile(
            title: const TextWidget('Licenses'),
            subtitle:
                const TextWidget('View the licenses of the libraries used'),
            trailing: const FaIcon(Icons.chevron_right),
            onTap: () => showLicensePage(
              context: context,
              applicationIcon: const LogoWidget(height: 120),
              applicationName: 'Tourism App',
            ),
          ),
        ],
      ),
    );
  }
}

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.hasData && data != null) {
          return TextWidget(data.version);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
