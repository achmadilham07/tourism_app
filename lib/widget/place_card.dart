import 'package:flutter/material.dart';
import 'package:tourism_app/model/place.dart';
import 'package:tourism_app/page/detail_page.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.item,
  });

  final Place item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPage(),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                item.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(item.name),
                subtitle: Text(item.address),
              ),
            )
          ],
        ),
      ),
    );
  }
}
