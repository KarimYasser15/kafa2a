import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kafa2a/features/requests/user/data/models/service_requests_response.dart';
import 'package:kafa2a/features/requests/user/data/models/service_request_model.dart';
import 'package:kafa2a/features/requests/user/domain/use_cases/get_all_service_requests.dart';
import 'package:kafa2a/features/requests/user/domain/use_cases/get_service_request_by_id.dart';
import 'package:kafa2a/features/requests/user/presentation/cubit/service_requests_states.dart';

@injectable
class ServiceRequestsCubit extends Cubit<ServiceRequestsStates> {
  final GetAllServiceRequests _getAllServiceRequests;
  final GetServiceRequestById _getServiceRequestById;

  ServiceRequestsCubit(this._getAllServiceRequests, this._getServiceRequestById)
      : super(ServiceRequestsInitialState());

  List<ServiceRequestModel> serviceRequests = [];

  Future<void> getAllServiceRequests() async {
    emit(ServiceRequestsLoadingState());
    final result = await _getAllServiceRequests();
    result.fold(
      (failure) => emit(ServiceRequestsErrorState(failure.message)),
      (response) {
        serviceRequests = response.data;
        emit(ServiceRequestsSuccessState(response));
      },
    );
  }

  Future<void> getServiceRequestById(int id) async {
    emit(ServiceRequestByIdLoadingState());
    final result = await _getServiceRequestById(id);
    result.fold(
      (failure) => emit(ServiceRequestByIdErrorState(failure.message)),
      (response) => emit(ServiceRequestByIdSuccessState(response)),
    );
  }
}
