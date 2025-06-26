import 'package:kafa2a/features/home/user/data/models/get_categories_response/get_categories_response.dart';

class RequestServiceStates {}

class RequestServiceInitialState extends RequestServiceStates {}

class GetCategoriesSuccessState extends RequestServiceStates {
  final List<GetCategoriesResponse> categories;
  GetCategoriesSuccessState(this.categories);
}

class GetCategoriesLoadingState extends RequestServiceStates {}

class GetCategoriesErrorState extends RequestServiceStates {
  GetCategoriesErrorState(this.error);

  final String error;
}

class RequestServiceErrorState extends RequestServiceStates {
  RequestServiceErrorState(this.error);

  final String error;
}

class RequestServiceLoadingState extends RequestServiceStates {}

class RequestServiceSuccessState extends RequestServiceStates {}
