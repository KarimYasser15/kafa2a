import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/error/exceptions.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:kafa2a/features/home/provider/data/data_source/provider_offers_remote_data_source.dart';
import 'package:kafa2a/features/home/provider/data/models/get_all_requests_response.dart';

@lazySingleton
class ProviderOffersRepository {
  final ProviderOffersRemoteDataSource _providerOffersRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  ProviderOffersRepository(
      this._providerOffersRemoteDataSource, this._authLocalDataSource);

  Future<Either<List<GetAllRequestsResponse>, Failure>> getAllRequests() async {
    try {
      final List<GetAllRequestsResponse> result =
          await _providerOffersRemoteDataSource
              .getAllRequests(_authLocalDataSource.getToken());
      return Left(result);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }
}
