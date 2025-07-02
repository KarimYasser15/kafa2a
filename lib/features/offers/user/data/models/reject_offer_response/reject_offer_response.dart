import 'package:kafa2a/features/offers/user/data/models/user_offers_response/service_request.dart';

class RejectOfferResponse {
  int id;
  int serviceRequestId;
  int providerId;
  String price;
  dynamic message;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  ServiceRequest serviceRequest;

  RejectOfferResponse({
    required this.id,
    required this.serviceRequestId,
    required this.providerId,
    required this.price,
    required this.message,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.serviceRequest,
  });

  factory RejectOfferResponse.fromJson(Map<String, dynamic> json) {
    return RejectOfferResponse(
      id: json['id'] as int,
      serviceRequestId: json['service_request_id'] as int,
      providerId: json['provider_id'] as int,
      price: json['price'] as String,
      message: json['message'] as dynamic,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      serviceRequest: ServiceRequest.fromJson(
          json['service_request'] as Map<String, dynamic>),
    );
  }
}
