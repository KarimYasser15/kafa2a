class GetNearbyProvidersRespons {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? type;
  String? phone;
  String? policeCertificatePath;
  String? selfiePath;
  String? nationalId;
  dynamic gender;
  double? lat;
  double? lng;
  String? address;
  String? serviceId;
  String? status;
  dynamic suspendReason;
  int? rating;
  dynamic review;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? distance;

  GetNearbyProvidersRespons({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.type,
    this.phone,
    this.policeCertificatePath,
    this.selfiePath,
    this.nationalId,
    this.gender,
    this.lat,
    this.lng,
    this.address,
    this.serviceId,
    this.status,
    this.suspendReason,
    this.rating,
    this.review,
    this.createdAt,
    this.updatedAt,
    this.distance,
  });

  factory GetNearbyProvidersRespons.fromJson(Map<String, dynamic> json) {
    return GetNearbyProvidersRespons(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as dynamic,
      type: json['type'] as String?,
      phone: json['phone'] as String?,
      policeCertificatePath: json['police_certificate_path'] as String?,
      selfiePath: json['selfie_path'] as String?,
      nationalId: json['national_id'] as String?,
      gender: json['gender'] as dynamic,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      address: json['address'] as String?,
      serviceId: json['service_id'] as String?,
      status: json['status'] as String?,
      suspendReason: json['suspend_reason'] as dynamic,
      rating: json['rating'] as int?,
      review: json['review'] as dynamic,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      distance: (json['distance'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'type': type,
        'phone': phone,
        'police_certificate_path': policeCertificatePath,
        'selfie_path': selfiePath,
        'national_id': nationalId,
        'gender': gender,
        'lat': lat,
        'lng': lng,
        'address': address,
        'service_id': serviceId,
        'status': status,
        'suspend_reason': suspendReason,
        'rating': rating,
        'review': review,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'distance': distance,
      };
}
