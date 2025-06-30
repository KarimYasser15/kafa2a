import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@lazySingleton
class AccessLocation {
  Location location = Location();

  Future<LocationData> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled. Please enable them.');
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permissions are denied. Please grant them.');
      }
    }
    locationData = await location.getLocation();
    return locationData;
  }
}
