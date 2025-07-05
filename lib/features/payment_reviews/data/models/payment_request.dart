import 'package:dio/dio.dart';

class PaymentRequest {
  PaymentRequest({
    required this.amount,
    required this.gateway,
    required this.providerId,
    required this.serviceId,
    required this.userId,
  });

  final int amount;
  final String gateway;
  final int providerId;
  final int serviceId;
  final int userId;

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'amount': amount,
      'gateway': gateway,
      'provider_id': providerId,
      'service_id': serviceId,
      'user_id': userId
    });
  }
}
