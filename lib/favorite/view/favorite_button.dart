import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/favorite/cubit/favorite_cubit.dart';
import 'package:tourism_app/destinations/model/destination.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.destination,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoriteCubit, FavoriteState, bool>(
      selector: (state) => state.contains(destination),
      builder: (context, isFavorite) => IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.pinkAccent : null,
        ),
        onPressed: () {
          context.read<FavoriteCubit>().toggleFavorite(destination);
          HapticFeedback.mediumImpact();
        },
      ),
    );
  }
}
