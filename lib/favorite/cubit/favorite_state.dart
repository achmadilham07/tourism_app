part of 'favorite_cubit.dart';

class FavoriteState {
  const FavoriteState({this.destinations = const []});

  final List<Destination> destinations;

  FavoriteState copyWith({List<Destination>? destinations}) {
    return FavoriteState(destinations: destinations ?? this.destinations);
  }

  bool contains(Destination value) => destinations.contains(value);
}
