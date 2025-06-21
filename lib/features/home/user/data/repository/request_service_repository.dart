import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/error/exceptions.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:kafa2a/features/home/user/data/data_sources/request_service_remote_data_source.dart';
import 'package:kafa2a/features/home/user/data/models/get_categories_response/get_categories_response.dart';
import 'package:kafa2a/features/home/user/data/models/request_service_request.dart';
import 'package:kafa2a/features/home/user/data/models/request_service_response.dart';

@lazySingleton
class RequestServiceRepository {
  RequestServiceRepository(
    this._requestServiceRemoteDataSource,
    this._authLocalDataSource,
  );

  final AuthLocalDataSource _authLocalDataSource;
  final RequestServiceRemoteDataSource _requestServiceRemoteDataSource;

  Future<Either<List<GetCategoriesResponse>, Failure>>
      getAllCategories() async {
    try {
      final String token = _authLocalDataSource.getToken();
      final List<GetCategoriesResponse> response =
          await _requestServiceRemoteDataSource.getAllCategories(token);
      return Left(response);
    } on AppException catch (exception) {
      return Right(Failure(
        exception.message,
      ));
    }
  }

  Future<Either<RequestServiceResponse, Failure>> requestService(
      RequestServiceRequest requestService) async {
    try {
      final String token = _authLocalDataSource.getToken();
      final RequestServiceResponse response =
          await _requestServiceRemoteDataSource.requestService(
              token, requestService);
      return Left(response);
    } on AppException catch (exception) {
      return Right(Failure(
        exception.message,
      ));
    }
  }
}
