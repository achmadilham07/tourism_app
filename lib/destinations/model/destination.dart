import 'dart:convert';

class Destination {
  final int id;
  final String name;
  final String description;
  final String address;
  final double longitude;
  final double latitude;
  final int like;
  final String image;
  Destination({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.like,
    required this.image,
  });

  Destination copyWith({
    int? id,
    String? name,
    String? description,
    String? address,
    double? longitude,
    double? latitude,
    int? like,
    String? image,
  }) {
    return Destination(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      like: like ?? this.like,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
      'like': like,
      'image': image,
    };
  }

  factory Destination.fromMap(Map<String, dynamic> map) {
    return Destination(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      description: map['description'] as String,
      address: map['address'] as String,
      longitude: map['longitude'].toDouble() as double,
      latitude: map['latitude'].toDouble() as double,
      like: map['like'].toInt() as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Destination.fromJson(String source) =>
      Destination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Destination(id: $id, name: $name, description: $description, address: $address, longitude: $longitude, latitude: $latitude, like: $like, image: $image)';
  }

  @override
  bool operator ==(covariant Destination other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.address == address &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.like == like &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        address.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        like.hashCode ^
        image.hashCode;
  }
}
