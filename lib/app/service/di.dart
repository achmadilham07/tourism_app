import 'package:get_it/get_it.dart';
import 'package:tourism_app/destinations/cubit/destination_list_cubit.dart';
import 'package:tourism_app/favorite/cubit/favorite_cubit.dart';
import 'package:tourism_app/launchpad/cubit/launchpad_cubit.dart';
import 'package:tourism_app/repository/local/load_asset.dart';
import 'package:tourism_app/repository/local/local_service.dart';
import 'package:tourism_app/theme/cubit/theme_cubit.dart';

final di = GetIt.instance;

void init() {
  di.registerFactory(() => LoadAsset());

  di.registerFactory(
    () => LocalService(di()),
  );

  di.registerFactory(
    () => DestinationListCubit(di()),
  );

  di.registerFactory(
    () => LaunchpadCubit(),
  );

  di.registerFactory(
    () => ThemeCubit(),
  );

  di.registerFactory(
    () => FavoriteCubit(),
  );
}
