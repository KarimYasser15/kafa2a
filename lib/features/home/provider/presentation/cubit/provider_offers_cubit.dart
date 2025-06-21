import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/home/provider/data/models/get_all_requests_response.dart';
import 'package:kafa2a/features/home/provider/data/repository/provider_offers_repository.dart';
import 'package:kafa2a/features/home/provider/presentation/cubit/provider_offers_states.dart';

@lazySingleton
class ProviderOffersCubit extends Cubit<ProviderOffersStates> {
  ProviderOffersCubit(this._providerOffersRepository)
      : super(ProviderOffersInitialState()) {
    getAllRequests();
  }

  final ProviderOffersRepository _providerOffersRepository;

  Future<void> getAllRequests() async {
    emit(GetAllRequestsLoadingState());
    final Either<List<GetAllRequestsResponse>, Failure> result =
        await _providerOffersRepository.getAllRequests();
    result.fold((requests) => emit(GetAllRequestsSuccessState(requests)),
        (failure) => emit(GetAllRequestsErrorState(failure.message)));
  }
}
