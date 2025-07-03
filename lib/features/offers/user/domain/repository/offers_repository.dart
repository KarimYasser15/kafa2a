import 'package:dartz/dartz.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/offers/user/data/models/accept_offer_response/accept_offer_response.dart';
import 'package:kafa2a/features/offers/user/data/models/reject_offer_response/reject_offer_response.dart';
import 'package:kafa2a/features/offers/user/data/models/user_offers_response/offers.dart';

abstract class OffersRepository {
  Future<Either<List<Offers>, Failure>> getOffers(int id);
  Future<Either<AcceptOfferResponse, Failure>> acceptOffer(int id);
  Future<Either<RejectOfferResponse, Failure>> rejectOffer(int id);
}
