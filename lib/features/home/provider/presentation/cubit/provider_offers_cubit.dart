import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/home/provider/data/models/get_all_requests_response.dart';
import 'package:kafa2a/features/home/provider/data/models/send_offer_request.dart';
import 'package:kafa2a/features/home/provider/data/models/send_offer_response/send_offer_response.dart';
import 'package:kafa2a/features/home/provider/domain/use_cases/get_all_requests.dart';
import 'package:kafa2a/features/home/provider/domain/use_cases/send_offer.dart';
import 'package:kafa2a/features/home/provider/presentation/cubit/provider_offers_states.dart';

@injectable
class ProviderOffersCubit extends Cubit<ProviderOffersStates> {
  ProviderOffersCubit(this._getAllRequests, this._sendOffer)
      : super(ProviderOffersInitialState()) {
    getAllRequests();
  }

  final GetAllRequests _getAllRequests;
  final SendOffer _sendOffer;
  Future<void> getAllRequests() async {
    emit(
      GetAllRequestsLoadingState(),
    );
    final Either<List<GetAllRequestsResponse>, Failure> result =
        await _getAllRequests();
    result.fold(
      (requests) => emit(
        GetAllRequestsSuccessState(
          requests,
        ),
      ),
      (failure) => emit(
        GetAllRequestsErrorState(
          failure.message,
        ),
      ),
    );
  }

  Future<void> sendOffer(SendOfferRequest sendOfferRequest) async {
    emit(
      SendOfferLoadingState(),
    );
    final Either<SendOfferResponse, Failure> result = await _sendOffer(
      sendOfferRequest,
    );
    result.fold(
      (response) => emit(
        SendOfferSuccessState(response.message!),
      ),
      (failure) => emit(
        SendOfferErrorState(failure.message),
      ),
    );
  }
}
