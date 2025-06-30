class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.type,
    required this.phone,
    this.address,
    this.policeCertificatePath,
    this.selfiePath,
    this.nationalId,
    this.gender,
    this.service,
    this.lat,
    this.lng,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        type: json['type'] as String,
        phone: json['phone'] as String,
        address: json['address'] as String?,
        policeCertificatePath: json['police_certificate_path'] as String?,
        selfiePath: json['selfie_path'] as String?,
        nationalId: json['national_id'] as String?,
        gender: json['gender'] as String?,
        service: json['service'] as String?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  String? address;
  DateTime createdAt;
  String email;
  dynamic emailVerifiedAt;
  String? gender;
  int id;
  String name;
  String? nationalId;
  String phone;
  String? policeCertificatePath;
  String? selfiePath;
  String? service;
  String type;
  DateTime updatedAt;
  String? lat;
  String? lng;
}
