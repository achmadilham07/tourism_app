import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/bookmark/cubit/bookmark_cubit.dart';
import 'package:tourism_app/destinations/view/destination_screen.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        final destinations = state.destinations;
        if (destinations.isEmpty) return const EmptyBookmarks();
        return AdaptiveDestinationBody(destinations: destinations);
      },
    );
  }
}

class EmptyBookmarks extends StatelessWidget {
  const EmptyBookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.bookBookmark,
              color: Colors.orange,
              size: 64,
            ),
            const SizedBox(height: 24),
            TextWidget(
              "Oops! You don't have any bookmarks",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const TextWidget(
              'Tap the bookmark icon to add destinations to your list',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
