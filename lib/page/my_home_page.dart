import 'package:flutter/material.dart';
import 'package:tourism_app/widget/heading_home.dart';
import 'package:tourism_app/widget/place_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const HeadingHome(),
            ListView.builder(
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
            ),
          ],
        ),
      ),
    );
  }
}
