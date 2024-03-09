part of 'updater_cubit.dart';

enum UpdaterStatus { idle, updateCheckInProgress, downloadInProgress }

class UpdaterState {
  const UpdaterState({
    this.status = UpdaterStatus.idle,
    this.updateAvailable = false,
    this.isNewPatchReadyToInstall = false,
  });

  final UpdaterStatus status;
  final bool updateAvailable;
  final bool isNewPatchReadyToInstall;

  UpdaterState copyWith({
    UpdaterStatus? status,
    bool? updateAvailable,
    bool? isNewPatchReadyToInstall,
  }) {
    return UpdaterState(
      status: status ?? this.status,
      updateAvailable: updateAvailable ?? this.updateAvailable,
      isNewPatchReadyToInstall:
          isNewPatchReadyToInstall ?? this.isNewPatchReadyToInstall,
    );
  }

  @override
  bool operator ==(covariant UpdaterState other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.updateAvailable == updateAvailable &&
      other.isNewPatchReadyToInstall == isNewPatchReadyToInstall;
  }

  @override
  int get hashCode => status.hashCode ^ updateAvailable.hashCode ^ isNewPatchReadyToInstall.hashCode;
}
