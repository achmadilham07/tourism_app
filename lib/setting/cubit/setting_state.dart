part of 'setting_cubit.dart';

class SettingState {
  const SettingState({
    required this.version,
    this.patchNumber,
  });

  final Version version;
  final int? patchNumber;

  SettingState copyWith({
    Version? version,
    int? patchNumber,
  }) {
    return SettingState(
      version: version ?? this.version,
      patchNumber: patchNumber ?? this.patchNumber,
    );
  }

  @override
  bool operator ==(covariant SettingState other) {
    if (identical(this, other)) return true;

    return other.version == version && other.patchNumber == patchNumber;
  }

  @override
  int get hashCode => version.hashCode ^ patchNumber.hashCode;
}
