import 'package:bloc/bloc.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:tourism_app/app/config/version.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({ShorebirdCodePush? codePush})
      : _codePush = codePush ?? ShorebirdCodePush(),
        super(SettingState(version: version));

  final ShorebirdCodePush _codePush;

  Future<void> init() async {
    final patchNumber = await _codePush.currentPatchNumber();
    emit(state.copyWith(patchNumber: patchNumber));
  }
}
