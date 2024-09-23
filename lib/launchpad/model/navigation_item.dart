import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const navigationDestination = [
  NavigationItem(
    icon: FaIcon(FontAwesomeIcons.bookmark),
    selectedIcon: FaIcon(FontAwesomeIcons.solidBookmark),
    label: "Bookmark",
  ),
  NavigationItem(
    icon: FaIcon(FontAwesomeIcons.list),
    selectedIcon: FaIcon(FontAwesomeIcons.tableList),
    label: "Destination",
  ),
  NavigationItem(
    icon: FaIcon(FontAwesomeIcons.gear),
    selectedIcon: FaIcon(FontAwesomeIcons.gears),
    label: "Setting",
  ),
];

class NavigationItem {
  final Widget icon;
  final Widget selectedIcon;
  final String label;

  const NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}
