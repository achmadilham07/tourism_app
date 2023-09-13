import 'package:flutter/material.dart';
import 'package:tourism_app/widget/heading_home.dart';
import 'package:tourism_app/widget/place_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<String> _loadJson;

  @override
  void initState() {
    _loadJson =
        DefaultAssetBundle.of(context).loadString('assets/tourism.json');
    super.initState();
  }

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
            FutureBuilder<String>(
              future: _loadJson,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state == null) {
                  return const CircularProgressIndicator();
                }

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
              },
            ),
          ],
        ),
      ),
    );
  }
}
