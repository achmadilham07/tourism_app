import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tourism_app/app/service/di.dart' as di;
import 'package:tourism_app/bookmark/cubit/bookmark_cubit.dart';
import 'package:tourism_app/firebase_options.dart';
import 'package:tourism_app/app/config/firebase_options.dart';
import 'package:tourism_app/launchpad/view/launchpad_screen.dart';
import 'package:tourism_app/theme/cubit/theme_cubit.dart';
import 'package:tourism_app/theme/theme.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.di.get<ThemeCubit>(),
        ),
        BlocProvider(
          create: (_) => di.di.get<BookmarkCubit>(),
        ),
      ],
      child: const AppView(),
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
      home: const LaunchpadScreen(),
    );
  }
}
