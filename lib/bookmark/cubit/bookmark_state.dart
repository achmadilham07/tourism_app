part of 'bookmark_cubit.dart';

class BookmarkState {
  const BookmarkState({this.destinations = const []});

  final List<Destination> destinations;

  BookmarkState copyWith({List<Destination>? destinations}) {
    return BookmarkState(destinations: destinations ?? this.destinations);
  }

  bool contains(Destination value) => destinations.contains(value);
}
