import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tourism_app/app/config/firebase_options.dart';
import 'package:tourism_app/bookmark/cubit/bookmark_cubit.dart';
import 'package:tourism_app/theme/cubit/theme_cubit.dart';
import 'package:tourism_app/widgetbook/widgetbook.dart';
import 'package:tourism_app/app/service/di.dart' as di;

// todo-02: create a new entry-point for widgetbook
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  if (kDebugMode) await HydratedBloc.storage.clear();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  di.init();
  runApp(const WidgetbookApp());
}

// todo-03: create an app widget
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // todo-04: add-ons related to device and view
      addons: addons,
      // todo-05: add directories related to screens and widgets
      directories: directories,
      initialRoute:
          "?path=screens/main/launchpadscreen&device={name:iPhone%20SE}",
      appBuilder: (context, child) {
        final vDI = di.di;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => vDI.get<ThemeCubit>(),
              ),
              BlocProvider(
                create: (_) => vDI.get<BookmarkCubit>(),
              ),
            ],
            child: child,
          ),
        );
      },
    );
  }
}
