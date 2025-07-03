import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/error/exceptions.dart';
import 'package:kafa2a/core/messages.dart';
import 'package:kafa2a/features/home/user/data/data_sources/map/map_remote_data_source.dart';
import 'package:kafa2a/features/home/user/data/models/get_nearby_providers_request.dart';

@Injectable(as: MapRemoteDataSource)
class MapApiDataSource implements MapRemoteDataSource {
  final Dio _dio;

  MapApiDataSource(this._dio);
  @override
  Future<void> getNearbyProviders(
      String token, GetNearbyProvidersRequest getNearbyProvidersRequest) async {
    try {
      final Response response = await _dio.get(ApiConstants.getNearbyProviders,
          data: getNearbyProvidersRequest.toJson(),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      print(response.data.toString());
    } catch (exception) {
      String errorMessage = Messages.failedToGetNearbyProviders;
      if (exception is DioException) {
        errorMessage = exception.response?.data['message'] ?? errorMessage;
      }
      throw (RemoteException(errorMessage));
    }
  }
}
