import 'package:kafa2a/features/requests/user/data/models/service_requests_response.dart';

abstract class ServiceRequestsStates {}

class ServiceRequestsInitialState extends ServiceRequestsStates {}

class ServiceRequestsLoadingState extends ServiceRequestsStates {}

class ServiceRequestsSuccessState extends ServiceRequestsStates {
  final ServiceRequestsResponse response;
  ServiceRequestsSuccessState(this.response);
}

class ServiceRequestsErrorState extends ServiceRequestsStates {
  final String error;
  ServiceRequestsErrorState(this.error);
}

class ServiceRequestByIdLoadingState extends ServiceRequestsStates {}

class ServiceRequestByIdSuccessState extends ServiceRequestsStates {
  final ServiceRequestsResponse response;
  ServiceRequestByIdSuccessState(this.response);
}

class ServiceRequestByIdErrorState extends ServiceRequestsStates {
  final String error;
  ServiceRequestByIdErrorState(this.error);
}
