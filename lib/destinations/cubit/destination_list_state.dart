part of 'destination_list_cubit.dart';

sealed class DestinationListState {}

final class DestinationListInitial extends DestinationListState {}

final class DestinationListLoading extends DestinationListState {}

final class DestinationListLoaded extends DestinationListState {
  final Destinations destinations;

  DestinationListLoaded(this.destinations);
}

final class DestinationListError extends DestinationListState {
  final String message;

  DestinationListError(this.message);
}
