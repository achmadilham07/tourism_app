import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/bookmark/view/bookmark_button.dart';
import 'package:tourism_app/app/widget/app_bar.dart';
import 'package:tourism_app/destinations/model/destination.dart';

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
                        ),
                        TextWidget(
                          destination.address,
                          style: theme.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  // TODO: Fix me later, add likes
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.red,
                      ),
                      TextWidget(
                        destination.like.toString(),
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
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
