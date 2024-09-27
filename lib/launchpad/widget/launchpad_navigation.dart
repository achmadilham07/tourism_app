import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/launchpad/cubit/launchpad_cubit.dart';
import 'package:tourism_app/launchpad/model/navigation_item.dart';

class LaunchpadBottomNavigationBar extends StatelessWidget {
  const LaunchpadBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: context.watch<LaunchpadCubit>().state.index,
      onDestinationSelected: (value) =>
          context.read<LaunchpadCubit>().update(value),
      destinations: navigationDestination
          .map(
            (item) => NavigationDestination(
              icon: item.icon,
              selectedIcon: item.selectedIcon,
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}

class LaunchpadNavigationRail extends StatelessWidget {
  const LaunchpadNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: context.watch<LaunchpadCubit>().state.index,
      onDestinationSelected: (value) =>
          context.read<LaunchpadCubit>().update(value),
      labelType: NavigationRailLabelType.all,
      destinations: navigationDestination
          .map(
            (item) => NavigationRailDestination(
              icon: item.icon,
              selectedIcon: item.selectedIcon,
              label: TextWidget(item.label),
            ),
          )
          .toList(),
    );
  }
}
