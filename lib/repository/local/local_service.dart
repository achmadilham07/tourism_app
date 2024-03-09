import 'package:tourism_app/repository/local/load_asset.dart';
import 'package:tourism_app/error/model/error_exception.dart';
import 'package:tourism_app/repository/model/result.dart';
import 'package:tourism_app/destinations/model/destinations.dart';

class LocalService {
  final LoadAsset _loadAsset;

  const LocalService(this._loadAsset);

  Future<Result> getDestinations() async {
    try {
      final result = await _loadAsset.loadJsonAsset();

      return Success(Destinations.fromJson(result));
    } on ErrorException catch (e) {
      return Failure(e);
    }
  }
}
