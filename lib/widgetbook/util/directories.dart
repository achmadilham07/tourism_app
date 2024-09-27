import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/app/service/di.dart';
import 'package:tourism_app/app/widget/logo_widget.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/bookmark/widget/bookmark_button.dart';
import 'package:tourism_app/bookmark/view/bookmark_screen.dart';
import 'package:tourism_app/destination_detail/view/destination_detail_screen.dart';
import 'package:tourism_app/destinations/view/destination_screen.dart';
import 'package:tourism_app/destinations/widget/destination_widget.dart';
import 'package:tourism_app/destinations/widget/likes_count.dart';
import 'package:tourism_app/launchpad/cubit/launchpad_cubit.dart';
import 'package:tourism_app/launchpad/view/launchpad_screen.dart';
import 'package:tourism_app/launchpad/widget/adaptive_launchpad.dart';
import 'package:tourism_app/setting/view/setting_screen.dart';
import 'package:tourism_app/theme/widget/theme_toggle.dart';
import 'package:tourism_app/widgetbook/widgetbook.dart';

final List<WidgetbookNode> directories = [
  WidgetbookCategory(
    name: 'Screens',
    children: [
      WidgetbookFolder(
        name: "Main",
        children: [
          WidgetbookUseCase(
            name: 'LaunchpadScreen',
            builder: (_) => const LaunchpadScreen(),
          ),
          WidgetbookUseCase(
            name: 'LaunchpadLargeView',
            builder: (_) => BlocProvider(
              create: (_) => di.get<LaunchpadCubit>(),
              child: const LaunchpadLargeView(),
            ),
          ),
          WidgetbookUseCase(
            name: 'LaunchpadSmallView',
            builder: (_) => BlocProvider(
              create: (_) => di.get<LaunchpadCubit>(),
              child: const LaunchpadSmallView(),
            ),
          ),
          WidgetbookUseCase(
            name: 'LaunchpadBody',
            builder: (context) => BlocProvider(
              create: (_) => di.get<LaunchpadCubit>(),
              child: LaunchpadBody(
                state: context.knobs.list(
                  label: "page",
                  options: LaunchpadState.values.map((state) => state).toList(),
                  initialOption: LaunchpadState.destination,
                  labelBuilder: (label) => LaunchpadState.values
                      .firstWhere((state) => state == label)
                      .name,
                ),
              ),
            ),
          ),
        ],
      ),
      WidgetbookFolder(
        name: "Bookmark",
        children: [
          WidgetbookUseCase(
            name: 'EmptyBookmarks',
            builder: (_) => const EmptyBookmarks(),
          ),
          WidgetbookUseCase(
            name: 'AdaptiveDestinationBookmarkBody',
            builder: (_) => AdaptiveDestinationBody(
              destinations: destinations,
            ),
          ),
        ],
      ),
      WidgetbookFolder(
        name: "Destination Detail",
        children: [
          WidgetbookUseCase(
            name: 'DestinationDetailScreen',
            builder: (context) => DestinationDetailScreen(
              destination: customDestination(context),
            ),
          ),
        ],
      ),
      WidgetbookFolder(
        name: "Setting",
        children: [
          WidgetbookUseCase(
            name: 'SettingScreen',
            builder: (_) => const SettingScreen(),
          ),
        ],
      ),
    ],
  ),
  WidgetbookCategory(
    name: 'Widgets',
    children: [
      WidgetbookUseCase(
        name: 'DestinationWidget',
        builder: (context) => DestinationWidget(
          destination: customDestination(context),
        ),
      ),
      WidgetbookUseCase(
        name: 'BookmarkButton',
        builder: (context) => BookmarkButton(
          defaultColor: context.knobs.list(
            label: "color",
            options: colorTag.map((tag) => tag.color).toList(),
            initialOption: Colors.grey,
            labelBuilder: (label) =>
                colorTag.firstWhere((tag) => tag.color == label).name,
          ),
          destination: customDestination(context),
        ),
      ),
      WidgetbookUseCase(
        name: 'LikesCount',
        builder: (context) => LikesCount(
          likes: context.knobs.int.slider(
            label: "likes",
            initialValue: bandaNeiraDestination.like,
            min: 1,
            max: 9999,
          ),
          color: context.knobs.list(
            label: "color",
            options: colorTag.map((tag) => tag.color).toList(),
            initialOption: Colors.red,
            labelBuilder: (label) =>
                colorTag.firstWhere((tag) => tag.color == label).name,
          ),
          textColor: context.knobs.list(
            label: "text color",
            options: colorTag.map((tag) => tag.color).toList(),
            initialOption: Colors.black,
            labelBuilder: (label) =>
                colorTag.firstWhere((tag) => tag.color == label).name,
          ),
        ),
      ),
      WidgetbookUseCase(
        name: 'TextWidget',
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8),
          child: TextWidget(
            context.knobs.string(
              label: "text",
              initialValue: bandaNeiraDestination.description,
              maxLines: 4,
            ),
            maxLines: context.knobs.int.slider(
              label: "max lines",
              initialValue: 1,
              max: 4,
              min: 1,
            ),
            overflow: context.knobs.list(
              label: "overflow",
              options: TextOverflow.values.map((align) => align).toList(),
              initialOption: TextOverflow.ellipsis,
              labelBuilder: (label) => TextOverflow.values
                  .firstWhere((align) => align == label)
                  .name,
            ),
          ),
        ),
      ),
      WidgetbookUseCase(
        name: 'LogoWidget',
        builder: (context) => LogoWidget(
          height: context.knobs.double.slider(
            label: "height",
            initialValue: kToolbarHeight,
            max: 200,
            min: kToolbarHeight,
            divisions: 4,
          ),
        ),
      ),
      WidgetbookUseCase(
        name: 'AppVersion',
        builder: (_) => const AppVersion(),
      ),
      WidgetbookUseCase(
        name: 'ThemeToggle',
        builder: (_) => const ThemeToggle(),
      ),
      WidgetbookUseCase(
        name: 'DestinationList',
        builder: (_) => DestinationList(
          destinations: destinations,
        ),
      ),
      WidgetbookUseCase(
        name: 'DestinationGrid',
        builder: (context) => DestinationGrid(
          destinations: [for (int i = 0; i <= 10; i++) ...destinations],
          crossAxisCount: context.knobs.int.slider(
            label: "column",
            initialValue: 2,
            min: 1,
            max: 4,
          ),
        ),
      ),
    ],
  ),
];
