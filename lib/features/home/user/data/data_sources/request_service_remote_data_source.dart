import 'package:kafa2a/features/home/user/data/models/get_categories_response/get_categories_response.dart';
import 'package:kafa2a/features/home/user/data/models/request_service_request.dart';
import 'package:kafa2a/features/home/user/data/models/request_service_response.dart';

abstract class RequestServiceRemoteDataSource {
  Future<List<GetCategoriesResponse>> getAllCategories(String token);
  void getAllServices(String token, String category);
  Future<RequestServiceResponse> requestService(
      String token, RequestServiceRequest requestService);
}
