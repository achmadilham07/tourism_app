import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/bookmark/view/bookmark_button.dart';
import 'package:tourism_app/destinations/model/destination.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({
    super.key,
    required this.destination,
    this.onTap,
  });

  final Destination destination;
  final Function()? onTap;

  final border = const BorderRadius.all(Radius.circular(16));
  final gradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white,
        Colors.transparent,
        Colors.transparent,
      ],
      stops: [
        0.2,
        0.8,
        1.0
      ]);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: border),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        borderRadius: border,
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.black26,
                BlendMode.multiply,
              ),
              child: Image.network(
                destination.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: BookmarkButton(
                destination: destination,
                defaultColor: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                        TextWidget(
                          destination.like.toString(),
                          style: textStyle.titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextWidget.heading(
                      destination.address,
                      style:
                          textStyle.titleSmall?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    TextWidget.heading(
                      destination.name,
                      style: textStyle.headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
