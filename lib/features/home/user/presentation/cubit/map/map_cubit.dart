import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/utils/access_location.dart';
import 'package:kafa2a/features/home/user/presentation/cubit/map/map_states.dart';

@injectable
class MapCubit extends Cubit<MapStates> {
  MapCubit(this._accessLocation) : super(MapInitialState());
  final AccessLocation _accessLocation;

  Future<void> getLocation() async {
    emit(MapLoadingState());
    try {
      final location = await _accessLocation.getLocation();
      emit(MapSuccessState(location));
    } catch (e) {
      if (!isClosed) {
        emit(MapErrorState());
      }
    }
  }
}
