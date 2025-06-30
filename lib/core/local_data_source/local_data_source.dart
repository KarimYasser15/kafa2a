import 'package:location/location.dart';

abstract class LocalDataSource {
  void saveLocation(LocationData location);
  Future<void> removeLocation();
  Future<LocationData?> getLocation();
}
