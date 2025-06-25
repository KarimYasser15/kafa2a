import '../../../../../core/models/service_model.dart';

class GetCategoriesResponse {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<ServiceModel> services;

  GetCategoriesResponse({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.services,
  });

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return GetCategoriesResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt: json['created_at'] =
          DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] =
          DateTime.parse(json['updated_at'] as String),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
