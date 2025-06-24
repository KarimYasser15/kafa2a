class OfferModel {
  final int providerId;
  final int price;
  final int serviceRequestId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  OfferModel({
    required this.providerId,
    required this.price,
    required this.serviceRequestId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        providerId: json['provider_id'] as int,
        price: json['price'] as int,
        serviceRequestId: json['service_request_id'] as int,
        updatedAt: DateTime.parse(json['updated_at'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        id: json['id'] as int,
      );
}
