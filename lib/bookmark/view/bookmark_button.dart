import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/bookmark/cubit/bookmark_cubit.dart';
import 'package:tourism_app/destinations/model/destination.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    super.key,
    required this.destination,
    this.defaultColor,
  });

  final Destination destination;
  final Color? defaultColor;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookmarkCubit, BookmarkState, bool>(
      selector: (state) => state.contains(destination),
      builder: (context, isBookmark) => IconButton(
        icon: Icon(
          isBookmark ? Icons.bookmark : Icons.bookmark_border,
          color: isBookmark ? Colors.orange : defaultColor,
        ),
        onPressed: () {
          context.read<BookmarkCubit>().toggleBookmark(destination);
          HapticFeedback.mediumImpact();
        },
      ),
    );
  }
}
