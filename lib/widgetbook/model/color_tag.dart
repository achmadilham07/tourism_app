import 'package:flutter/material.dart';
import 'package:tourism_app/widgetbook/widgetbook.dart';

class ColorTag extends Tag {
  final Color color;

  ColorTag({
    required super.name,
    required this.color,
  });
}

final colorTag = [
  ColorTag(
    name: "Blue",
    color: Colors.blue,
  ),
  ColorTag(
    name: "Red",
    color: Colors.red,
  ),
  ColorTag(
    name: "Purple",
    color: Colors.purple,
  ),
  ColorTag(
    name: "Yellow",
    color: Colors.yellow,
  ),
  ColorTag(
    name: "Black",
    color: Colors.black,
  ),
  ColorTag(
    name: "White",
    color: Colors.white,
  ),
  ColorTag(
    name: "Grey",
    color: Colors.grey,
  ),
  ColorTag(
    name: "Green",
    color: Colors.green,
  ),
  ColorTag(
    name: "Orange",
    color: Colors.orange,
  ),
];
