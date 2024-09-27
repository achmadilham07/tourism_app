import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/app/service/di.dart';
import 'package:tourism_app/error/view/error_screen.dart';
import 'package:tourism_app/destinations/cubit/destination_list_cubit.dart';
import 'package:tourism_app/destinations/model/destination.dart';
import 'package:tourism_app/destinations/widget/destination_widget.dart';
import 'package:tourism_app/destination_detail/view/destination_detail_screen.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.get<DestinationListCubit>(),
      child: const DestinationView(),
    );
  }
}

class DestinationView extends StatelessWidget {
  const DestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    final destinationListCubit = context.read<DestinationListCubit>();
    Future.microtask(() {
      destinationListCubit.getDestinations();
    });

    return BlocBuilder<DestinationListCubit, DestinationListState>(
      builder: (context, state) {
        return switch (state) {
          DestinationListLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          DestinationListLoaded(destinations: var item) =>
            AdaptiveDestinationBody(destinations: item.destinations),
          DestinationListError(message: var msg) => ErrorScreen(
              message: msg,
            ),
          _ => const SizedBox(),
        };
      },
    );
  }
}

class AdaptiveDestinationBody extends StatelessWidget {
  const AdaptiveDestinationBody({
    super.key,
    required this.destinations,
  });

  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = switch (width) {
          >= 450 && < 600 => 1,
          >= 600 && < 900 => 2,
          >= 900 && < 1400 => 3,
          >= 1400 => 4,
          _ => 1,
        };
        return switch (crossAxisCount) {
          1 => DestinationList(destinations: destinations),
          _ => DestinationGrid(
              destinations: destinations,
              crossAxisCount: crossAxisCount,
            ),
        };
      },
    );
  }
}

class DestinationList extends StatelessWidget {
  const DestinationList({
    super.key,
    required this.destinations,
  });

  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        final item = destinations[index];
        return DestinationWidget(
          destination: item,
          onTap: () {
            Navigator.of(context).push(
              DestinationDetailScreen.route(
                destination: item,
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox.square(dimension: 12);
      },
      itemCount: destinations.length,
    );
  }
}

class DestinationGrid extends StatelessWidget {
  const DestinationGrid({
    super.key,
    required this.destinations,
    this.crossAxisCount = 2,
  });

  final List<Destination> destinations;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final item = destinations[index];
        return DestinationWidget(
          destination: item,
          onTap: () {
            Navigator.of(context).push(
              DestinationDetailScreen.route(
                destination: item,
              ),
            );
          },
        );
      },
      itemCount: destinations.length,
    );
  }
}
