import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/app/widget/app_bar.dart';
import 'package:tourism_app/bookmark/view/bookmark_screen.dart';
import 'package:tourism_app/destinations/view/destination_screen.dart';
import 'package:tourism_app/launchpad/cubit/launchpad_cubit.dart';
import 'package:tourism_app/launchpad/widget/launchpad_navigation.dart';
import 'package:tourism_app/setting/view/setting_screen.dart';

class AdaptiveLaunchpadView extends StatelessWidget {
  const AdaptiveLaunchpadView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthOfWindow = constraints.maxWidth;
        return switch (widthOfWindow) {
          < 840 => const LaunchpadSmallView(),
          _ => const LaunchpadLargeView(),
        };
      },
    );
  }
}

class LaunchpadLargeView extends StatelessWidget {
  const LaunchpadLargeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LaunchpadNavigationRail(),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Scaffold(
            appBar: const DestinationAppBar(),
            body: BlocBuilder<LaunchpadCubit, LaunchpadState>(
              builder: (context, state) => LaunchpadBody(state: state),
            ),
          ),
        ),
      ],
    );
  }
}

class LaunchpadSmallView extends StatelessWidget {
  const LaunchpadSmallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DestinationAppBar(),
      body: BlocBuilder<LaunchpadCubit, LaunchpadState>(
        builder: (context, state) => LaunchpadBody(state: state),
      ),
      bottomNavigationBar: const LaunchpadBottomNavigationBar(),
    );
  }
}

class LaunchpadBody extends StatelessWidget {
  final LaunchpadState state;

  const LaunchpadBody({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      LaunchpadState.bookmark => const BookmarkScreen(),
      LaunchpadState.destination => const DestinationScreen(),
      LaunchpadState.setting => const SettingScreen(),
    };
  }
}
