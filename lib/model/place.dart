class Place {
  final int id;
  final String name;
  final String description;
  final String address;
  final double longitude;
  final double latitude;
  final int like;
  final String image;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.like,
    required this.image,
  });

  Place copyWith({
    int? id,
    String? name,
    String? description,
    String? address,
    double? longitude,
    double? latitude,
    int? like,
    String? image,
  }) =>
      Place(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        address: address ?? this.address,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        like: like ?? this.like,
        image: image ?? this.image,
      );

  factory Place.fromMap(Map<String, dynamic> json) => Place(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    address: json["address"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    like: json["like"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "like": like,
    "image": image,
  };
}
