class PaymentRequest {
  PaymentRequest({
    required this.amount,
    required this.gateway,
    required this.providerId,
    required this.serviceRequestId,
    required this.userId,
  });

  final int amount;
  final String gateway;
  final int providerId;
  final int serviceRequestId;
  final int userId;

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'gateway': gateway,
        'provider_id': providerId,
        'service_request_id': serviceRequestId,
        'user_id': userId
      };
}
