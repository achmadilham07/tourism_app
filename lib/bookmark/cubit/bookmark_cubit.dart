import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tourism_app/destinations/model/destination.dart';
import 'package:tourism_app/destinations/model/destinations.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends HydratedCubit<BookmarkState> {
  BookmarkCubit() : super(const BookmarkState());

  void toggleBookmark(Destination destination) {
    final destinations = [...state.destinations];
    destinations.contains(destination)
        ? destinations.remove(destination)
        : destinations.add(destination);
    final reverseDestinations = destinations.reversed.toList();
    emit(state.copyWith(destinations: reverseDestinations));
  }

  @override
  BookmarkState? fromJson(Map<String, dynamic> json) {
    final destinations = Destinations.fromMap(json).destinations;
    return BookmarkState(destinations: destinations);
  }

  @override
  Map<String, dynamic>? toJson(BookmarkState state) {
    final json = Destinations(destinations: state.destinations);
    return json.toMap();
  }
}
