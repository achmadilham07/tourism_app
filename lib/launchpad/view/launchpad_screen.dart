import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/app/service/di.dart';
import 'package:tourism_app/launchpad/cubit/launchpad_cubit.dart';
import 'package:tourism_app/destinations/view/destination_screen.dart';
import 'package:tourism_app/setting/view/setting_screen.dart';
import 'package:tourism_app/app/widget/app_bar.dart';

class LaunchpadScreen extends StatelessWidget {
  const LaunchpadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.get<LaunchpadCubit>(),
      child: const LaunchpadView(),
    );
  }
}

class LaunchpadView extends StatelessWidget {
  const LaunchpadView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DestinationAppBar(),
      body: LaunchpadBody(),
      bottomNavigationBar: LaunchpadBottomNavigationBar(),
    );
  }
}

class LaunchpadBody extends StatelessWidget {
  const LaunchpadBody({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LaunchpadCubit>().state;
    return switch (state) {
      // TODO: Fix me later using BookmarkScreen
      LaunchpadState.bookmark => const SizedBox(),
      LaunchpadState.destination => const DestinationScreen(),
      LaunchpadState.setting => const SettingScreen(),
    };
  }
}

class LaunchpadBottomNavigationBar extends StatelessWidget {
  const LaunchpadBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<LaunchpadCubit>().state.index,
      onTap: (value) => context.read<LaunchpadCubit>().update(value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          activeIcon: Icon(Icons.bookmark),
          label: "Bookmark",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          activeIcon: Icon(Icons.list_alt),
          label: "Destination",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          activeIcon: Icon(Icons.settings_applications),
          label: "Setting",
        ),
      ],
    );
  }
}
