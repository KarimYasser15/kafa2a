class Payment {
  String? userId;
  String? providerId;
  String? serviceRequestId;
  String? amount;
  String? gateway;
  String? status;
  String? transactionId;
  DateTime? paidAt;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Payment({
    this.userId,
    this.providerId,
    this.serviceRequestId,
    this.amount,
    this.gateway,
    this.status,
    this.transactionId,
    this.paidAt,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        userId: json['user_id'] as String?,
        providerId: json['provider_id'] as String?,
        serviceRequestId: json['service_request_id'] as String?,
        amount: json['amount'] as String?,
        gateway: json['gateway'] as String?,
        status: json['status'] as String?,
        transactionId: json['transaction_id'] as String?,
        paidAt: json['paid_at'] == null
            ? null
            : DateTime.parse(json['paid_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'provider_id': providerId,
        'service_request_id': serviceRequestId,
        'amount': amount,
        'gateway': gateway,
        'status': status,
        'transaction_id': transactionId,
        'paid_at': paidAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
