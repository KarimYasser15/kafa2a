import 'package:kafa2a/features/home/provider/data/models/get_all_requests_response.dart';

abstract class ProviderOffersStates {}

class ProviderOffersInitialState extends ProviderOffersStates {}

class GetAllRequestsLoadingState extends ProviderOffersStates {}

class GetAllRequestsErrorState extends ProviderOffersStates {
  String error;
  GetAllRequestsErrorState(this.error);
}

class GetAllRequestsSuccessState extends ProviderOffersStates {
  List<GetAllRequestsResponse> requests;
  GetAllRequestsSuccessState(this.requests);
}

class SendOfferLoadingState extends ProviderOffersStates {}

class SendOfferErrorState extends ProviderOffersStates {
  String error;
  SendOfferErrorState(this.error);
}

class SendOfferSuccessState extends ProviderOffersStates {}
