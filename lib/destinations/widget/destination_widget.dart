import 'package:flutter/material.dart';
import 'package:tourism_app/app/widget/text_widget.dart';
import 'package:tourism_app/bookmark/widget/bookmark_button.dart';
import 'package:tourism_app/destinations/model/destination.dart';
import 'package:tourism_app/destinations/widget/likes_count.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({
    super.key,
    required this.destination,
    this.onTap,
  });

  final Destination destination;
  final Function()? onTap;

  final border = const BorderRadius.all(Radius.circular(0));

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: border),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 200,
        child: InkWell(
          onTap: onTap,
          borderRadius: border,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Image.network(
                destination.image,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: BookmarkButton(
                  destination: destination,
                  defaultColor: Colors.white,
                ),
              ),
              Positioned.fill(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LikesCount(
                        likes: destination.like,
                        textColor: Colors.white,
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
      ),
    );
  }
}
