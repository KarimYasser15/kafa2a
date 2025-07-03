import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/error/exceptions.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:kafa2a/features/offers/user/data/data_sources/offers_user_remote_data_source.dart';
import 'package:kafa2a/features/offers/user/data/models/accept_offer_response/accept_offer_response.dart';
import 'package:kafa2a/features/offers/user/data/models/reject_offer_response/reject_offer_response.dart';
import 'package:kafa2a/features/offers/user/data/models/user_offers_response/offers.dart';
import 'package:kafa2a/features/offers/user/domain/repository/offers_repository.dart';

@Injectable(as: OffersRepository)
class OffersRepositoryImpl implements OffersRepository {
  final AuthLocalDataSource _authLocalDataSource;
  final OffersUserRemoteDataSource _offersUserRemoteDataSource;
  OffersRepositoryImpl(
      this._authLocalDataSource, this._offersUserRemoteDataSource);
  @override
  Future<Either<List<Offers>, Failure>> getOffers(int id) async {
    try {
      final List<Offers> offers = await _offersUserRemoteDataSource.getOffers(
          _authLocalDataSource.getToken(), id);
      return Left(offers);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }

  @override
  Future<Either<AcceptOfferResponse, Failure>> acceptOffer(int id) async {
    try {
      final AcceptOfferResponse acceptOffer = await _offersUserRemoteDataSource
          .acceptOffer(_authLocalDataSource.getToken(), id);
      return Left(acceptOffer);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }

  @override
  Future<Either<RejectOfferResponse, Failure>> rejectOffer(int id) async {
    try {
      final RejectOfferResponse rejectOffer = await _offersUserRemoteDataSource
          .rejectOffer(_authLocalDataSource.getToken(), id);
      return Left(rejectOffer);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }
}
