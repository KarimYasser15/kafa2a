import 'package:kafa2a/core/models/user_model.dart';

class GetAllRequestsResponse {
  int id;
  int userId;
  int serviceId;
  dynamic title;
  String description;
  String? location;
  String price;
  String scheduledAt;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  UserModel user;

  GetAllRequestsResponse({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.scheduledAt,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory GetAllRequestsResponse.fromJson(Map<String, dynamic> json) {
    return GetAllRequestsResponse(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      serviceId: json['service_id'] as int,
      title: json['title'] as dynamic,
      description: json['description'] as String,
      location: json['location'] as String,
      price: json['price'] as String,
      scheduledAt: json['scheduled_at'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
