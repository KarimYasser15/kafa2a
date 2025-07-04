import 'package:kafa2a/features/home/user/data/models/get_nearby_providers_request.dart';

abstract class MapRemoteDataSource {
  Future<void> getNearbyProviders(
      String token, GetNearbyProvidersRequest getNearbyProvidersRequest);
}
