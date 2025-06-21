import 'package:kafa2a/features/home/provider/data/models/get_all_requests_response.dart';

abstract class ProviderOffersRemoteDataSource {
  Future<List<GetAllRequestsResponse>> getAllRequests(String token);
  Future<void> sendOffer(String token);
}
