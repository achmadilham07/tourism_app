import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light);

  void toggle([ThemeState? value]) =>
      emit(value ?? (state.isLight ? ThemeState.dark : ThemeState.light));

  @override
  ThemeState? fromJson(Map<String, dynamic> json) =>
      ThemeState.values[json['index'] as int];

  @override
  Map<String, dynamic>? toJson(ThemeState state) => {'index': state.index};
}
