import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/error/exceptions.dart';
import 'package:kafa2a/core/messages.dart';
import 'package:kafa2a/features/home/user/data/data_sources/request_service_remote_data_source.dart';
import 'package:kafa2a/features/home/user/data/mappers/category_mapper.dart';
import 'package:kafa2a/features/home/user/data/models/get_categories_response/get_categories_response.dart';
import 'package:kafa2a/features/home/user/data/models/request_service_request.dart';
import 'package:kafa2a/features/home/user/data/models/request_service_response.dart';
import 'package:kafa2a/features/home/user/domain/entities/category.dart';

@LazySingleton(as: RequestServiceRemoteDataSource)
class RequestServiceApiDataSource extends RequestServiceRemoteDataSource {
  RequestServiceApiDataSource(this._dio);

  final Dio _dio;

  @override
  Future<List<Category>> getAllCategories(String token) async {
    try {
      final Response response = await _dio.get(ApiConstants.getCategories,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      List<GetCategoriesResponse> categories = (response.data as List)
          .map((category) => GetCategoriesResponse.fromJson(category))
          .toList();
      return categories.map((category) => category.toCategoryEntity).toList();
    } catch (exception) {
      String errorMessage = Messages.failedToGetCategories;
      if (exception is DioException) {
        errorMessage = exception.response?.data['message'] ?? errorMessage;
      }
      throw (RemoteException(errorMessage));
    }
  }

  @override
  void getAllServices(String token, String category) {
    // TODO: implement getAllServices
  }

  @override
  Future<RequestServiceResponse> requestService(
      String token, RequestServiceRequest requestService) async {
    try {
      final Response response = await _dio.post(ApiConstants.requestService,
          data: requestService.toJson(),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      return RequestServiceResponse.fromJson(response.data);
    } catch (exception) {
      String errorMessage = Messages.failedToRequestService;
      if (exception is DioException) {
        errorMessage = errorMessage;
      }
      throw (RemoteException(errorMessage));
    }
  }
}
