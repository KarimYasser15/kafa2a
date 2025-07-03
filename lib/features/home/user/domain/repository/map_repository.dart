import 'package:dartz/dartz.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/home/user/data/models/get_nearby_providers_request.dart';

abstract class MapRepository {
  Future<Either<void, Failure>> getNearbyProviders(
      GetNearbyProvidersRequest getNearbyprovidersRequest);
}
