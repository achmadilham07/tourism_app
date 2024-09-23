import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final isBookmark = context
        .select((BookmarkCubit bloc) => bloc.state.contains(destination));
    return IconButton(
      icon: FaIcon(
        isBookmark ? FontAwesomeIcons.solidBookmark : FontAwesomeIcons.bookmark,
        color: isBookmark ? Colors.orange : defaultColor,
      ),
      onPressed: () {
        context.read<BookmarkCubit>().toggleBookmark(destination);
      },
    );
  }
}
