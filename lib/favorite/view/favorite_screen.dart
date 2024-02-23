import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/favorite/cubit/favorite_cubit.dart';
import 'package:tourism_app/destinations/view/destination_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) => const FavoriteView();
}

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state.destinations.isEmpty) return const EmptyFavorites();
        return DestinationList(destinations: state.destinations);
      },
    );
  }
}

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.heart_broken_sharp,
              color: Colors.pinkAccent,
              size: 64,
            ),
            const SizedBox(height: 24),
            TextWidget(
              "You don't have any favorites",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const TextWidget(
              'Tap the heart icon to add destinations to your favorites',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
