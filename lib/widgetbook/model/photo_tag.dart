import 'package:tourism_app/widgetbook/widgetbook.dart';

class PhotoTag extends Tag {
  final String photoUrl;

  PhotoTag({
    required super.name,
    required this.photoUrl,
  });
}

final listOfPhoto = [
  PhotoTag(
    name: "Banda Neira",
    photoUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Bandaneira-0039.JPG/1600px-Bandaneira-0039.JPG",
  ),
  PhotoTag(
    name: "Bunaken",
    photoUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Sunset_at_Bunaken_Island%2C_Sulawesi%2C_2016.jpg/800px-Sunset_at_Bunaken_Island%2C_Sulawesi%2C_2016.jpg",
  ),
  PhotoTag(
    name: "Danau Toba",
    photoUrl:
        "https://cdn.pixabay.com/photo/2016/12/09/11/51/lake-toba-1894746_960_720.jpg",
  ),
  PhotoTag(
    name: "Gunung Bromo",
    photoUrl:
        "https://images.unsplash.com/photo-1505993597083-3bd19fb75e57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1354&q=80",
  ),
];
