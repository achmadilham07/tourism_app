import 'package:tourism_app/model/place.dart';

class TourismResponse {
  final bool error;
  final String message;
  final int count;
  final List<Place> places;

  TourismResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.places,
  });

  TourismResponse copyWith({
    bool? error,
    String? message,
    int? count,
    List<Place>? places,
  }) =>
      TourismResponse(
        error: error ?? this.error,
        message: message ?? this.message,
        count: count ?? this.count,
        places: places ?? this.places,
      );

  factory TourismResponse.fromMap(Map<String, dynamic> json) => TourismResponse(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    places: List<Place>.from(json["places"].map((x) => Place.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "error": error,
    "message": message,
    "count": count,
    "places": List<dynamic>.from(places.map((x) => x.toMap())),
  };
}
