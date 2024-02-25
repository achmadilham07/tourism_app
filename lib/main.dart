import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:tourism_app/app/service/di.dart' as di;
import 'package:tourism_app/bookmark/cubit/bookmark_cubit.dart';
import 'package:tourism_app/app/config/firebase_options.dart';
import 'package:tourism_app/launchpad/view/launchpad_screen.dart';
import 'package:tourism_app/theme/cubit/theme_cubit.dart';
import 'package:tourism_app/theme/theme.dart';
import 'package:tourism_app/updater/cubit/updater_cubit.dart';
import 'package:tourism_app/updater/widget/update_listener.dart';

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
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final vDI = di.di;
    return RepositoryProvider(
      create: (_) => ShorebirdCodePush(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => vDI.get<ThemeCubit>(),
          ),
          BlocProvider(
            create: (_) => vDI.get<BookmarkCubit>(),
          ),
          BlocProvider(
            create: (_) => vDI.get<UpdaterCubit>()..init(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select<ThemeCubit, ThemeMode>(
      (ThemeCubit cubit) =>
          cubit.state.isLight ? ThemeMode.light : ThemeMode.dark,
    );
    return MaterialApp(
      title: 'Tourism App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const UpdateListener(child: LaunchpadScreen()),
    );
  }
}
