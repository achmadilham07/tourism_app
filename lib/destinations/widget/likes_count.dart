import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tourism_app/app/widget/text_widget.dart';

class LikesCount extends StatelessWidget {
  const LikesCount({
    super.key,
    required this.likes,
    this.color = Colors.red,
    this.textColor,
  });

  final num likes;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final titleMediumTheme = Theme.of(context).textTheme.titleMedium;
    final likesFormatting = NumberFormat.compact().format(likes);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          FontAwesomeIcons.solidHeart,
          color: color,
        ),
        TextWidget(
          likesFormatting.toString(),
          style: titleMediumTheme?.copyWith(
            color: textColor ?? titleMediumTheme.color,
          ),
        ),
      ],
    );
  }
}
