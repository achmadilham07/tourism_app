import 'package:flutter/material.dart';
import 'package:tourism_app/widget/place_card.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      primary: false,
      itemBuilder: (context, index) {
        return const PlaceCard();
      },
    );
  }
}
