import 'package:flutter/services.dart';

class LoadAsset {
  Future<String> loadJsonAsset({
    String filePath = 'assets/tourism.json',
  }) async {
    return rootBundle.loadString(filePath);
  }
}
