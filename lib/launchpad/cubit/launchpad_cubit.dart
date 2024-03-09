import 'package:bloc/bloc.dart';

part 'launchpad_state.dart';

class LaunchpadCubit extends Cubit<LaunchpadState> {
  LaunchpadCubit() : super(LaunchpadState.destination);

  void update(int index) => emit(LaunchpadState.values[index]);
}
