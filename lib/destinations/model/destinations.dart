import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tourism_app/destinations/model/destination.dart';

class Destinations {
  final List<Destination> destinations;
  Destinations({
    required this.destinations,
  });

  Destinations copyWith({
    List<Destination>? destinations,
  }) {
    return Destinations(
      destinations: destinations ?? this.destinations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'destinations': destinations.map((x) => x.toMap()).toList(),
    };
  }

  factory Destinations.fromMap(Map<String, dynamic> map) {
    return Destinations(
      destinations: List<Destination>.from(
        (map['destinations'] as List<dynamic>).map<Destination>(
          (x) => Destination.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Destinations.fromJson(String source) =>
      Destinations.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Destinations(destinations: $destinations)';

  @override
  bool operator ==(covariant Destinations other) {
    if (identical(this, other)) return true;

    return listEquals(other.destinations, destinations);
  }

  @override
  int get hashCode => destinations.hashCode;
}
