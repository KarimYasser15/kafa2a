import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/home/user/data/models/get_categories_response/get_categories_response.dart';
import 'package:kafa2a/features/home/user/data/models/request_service_request.dart';
import 'package:kafa2a/features/home/user/data/models/request_service_response.dart';
import 'package:kafa2a/features/home/user/data/repository/request_service_repository.dart';
import 'package:kafa2a/features/home/user/presentation/cubit/request_service_states.dart';

@injectable
class RequestServiceCubit extends Cubit<RequestServiceStates> {
  RequestServiceCubit(this._requestServiceRepository)
      : super(RequestServiceInitialState()) {
    getAllCategories();
  }

  final RequestServiceRepository _requestServiceRepository;

  Future<void> getAllCategories() async {
    emit(GetCategoriesLoadingState());
    Either<List<GetCategoriesResponse>, Failure> response =
        await _requestServiceRepository.getAllCategories();
    response.fold(
      (categories) => emit(GetCategoriesSuccessState(categories)),
      (error) => emit(GetCategoriesErrorState(error.message)),
    );
  }

  Future<void> requestService(RequestServiceRequest requestService) async {
    emit(RequestServiceLoadingState());
    final Either<RequestServiceResponse, Failure> response =
        await _requestServiceRepository.requestService(requestService);
    response.fold(
      (_) => emit(RequestServiceSuccessState()),
      (error) => emit(RequestServiceErrorState(error.message)),
    );
  }
}
