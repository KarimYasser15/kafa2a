class Service {
  int id;
  String name;
  dynamic description;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as dynamic,
        categoryId: json['category_id'] as int,
        createdAt: json['created_at'] =
            DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] =
            DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'category_id': categoryId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
