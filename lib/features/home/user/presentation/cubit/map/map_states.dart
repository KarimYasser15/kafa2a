import 'package:location/location.dart';

abstract class MapStates {}

class MapInitialState extends MapStates {}

class MapLoadingState extends MapStates {}

class MapSuccessState extends MapStates {
  final LocationData location;
  MapSuccessState(this.location);
}

class MapErrorState extends MapStates {}

class NearbyProvidersSuccessState extends MapStates {}

class NearbyProvidersErrorState extends MapStates {}
