import 'package:bloc/bloc.dart';
import 'package:tourism_app/repository/local/local_service.dart';
import 'package:tourism_app/repository/model/result.dart';
import 'package:tourism_app/destinations/model/destinations.dart';

part 'destination_list_state.dart';

class DestinationListCubit extends Cubit<DestinationListState> {
  DestinationListCubit(this._localService) : super(DestinationListInitial());

  final LocalService _localService;

  void getDestinations() async {
    emit(DestinationListLoading());
    final result = await _localService.getDestinations();

    switch (result) {
      case Success():
        emit(DestinationListLoaded(result.value));
        return;
      case Failure():
        emit(DestinationListError(result.error.message));
        return;
    }
  }
}
