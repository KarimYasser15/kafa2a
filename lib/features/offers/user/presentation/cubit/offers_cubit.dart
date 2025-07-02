import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/offers/user/data/models/accept_offer_response/accept_offer_response.dart';
import 'package:kafa2a/features/offers/user/data/models/reject_offer_response/reject_offer_response.dart';
import 'package:kafa2a/features/offers/user/data/models/user_offers_response/offers.dart';
import 'package:kafa2a/features/offers/user/domain/use_cases/get_offers.dart';
import 'package:kafa2a/features/offers/user/domain/use_cases/accept_offer.dart';
import 'package:kafa2a/features/offers/user/domain/use_cases/reject_offer.dart';
import 'offers_states.dart';

@injectable
class OffersCubit extends Cubit<OffersStates> {
  OffersCubit(this._getOffers, this._acceptOffer, this._rejectOffer)
      : super(OffersInitialState());

  final GetOffers _getOffers;
  final AcceptOffer _acceptOffer;
  final RejectOffer _rejectOffer;

  List<Offers> offers = [];

  Future<void> getOffers() async {
    emit(OffersLoadingState());
    final Either<List<Offers>, Failure> result = await _getOffers();
    result.fold(
      (data) {
        offers = data;
        emit(OffersSuccessState(data));
      },
      (failure) {
        emit(OffersErrorState(failure.message));
      },
    );
  }

  Future<void> acceptOffer(int id) async {
    emit(ManageOfferLoadingState());
    final Either<AcceptOfferResponse, Failure> result = await _acceptOffer(id);
    result.fold(
      (response) => emit(AcceptOfferSuccessState(response)),
      (failure) => emit(ManageOfferErrorState(failure.message)),
    );
  }

  Future<void> rejectOffer(int id) async {
    emit(ManageOfferLoadingState());
    final Either<RejectOfferResponse, Failure> result = await _rejectOffer(id);
    result.fold(
      (response) => emit(RejectOfferSuccessState(response)),
      (failure) => emit(ManageOfferErrorState(failure.message)),
    );
  }
}
