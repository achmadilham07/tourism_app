import 'package:flutter/material.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/bookmark/widget/bookmark_button.dart';
import 'package:tourism_app/app/widget/app_bar.dart';
import 'package:tourism_app/destinations/model/destination.dart';
import 'package:tourism_app/destinations/widget/likes_count.dart';

class DestinationDetailScreen extends StatelessWidget {
  const DestinationDetailScreen({
    super.key,
    required this.destination,
  });

  static Route<void> route({required Destination destination}) {
    return MaterialPageRoute(
      builder: (_) => DestinationDetailScreen(destination: destination),
    );
  }

  final Destination destination;

  @override
  Widget build(BuildContext context) => DestinationDetailView(
        destination: destination,
      );
}

class DestinationDetailView extends StatelessWidget {
  const DestinationDetailView({
    super.key,
    required this.destination,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DestinationSliverAppBar(
            actions: [
              BookmarkButton(destination: destination),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: Image.network(
                destination.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          destination.name,
                          style: theme.textTheme.headlineLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextWidget(
                          destination.address,
                          style: theme.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  LikesCount(
                    likes: destination.like,
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: TextWidget(
                destination.description,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
