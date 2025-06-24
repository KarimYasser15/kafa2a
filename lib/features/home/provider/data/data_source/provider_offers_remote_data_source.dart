import 'package:kafa2a/features/home/provider/data/models/get_all_requests_response.dart';
import 'package:kafa2a/features/home/provider/data/models/send_offer_request.dart';
import 'package:kafa2a/features/home/provider/data/models/send_offer_response/send_offer_response.dart';

abstract class ProviderOffersRemoteDataSource {
  Future<List<GetAllRequestsResponse>> getAllRequests(String token);
  Future<SendOfferResponse> sendOffer(
      String token, SendOfferRequest sendOfferRequest);
}
