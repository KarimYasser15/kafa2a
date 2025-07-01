class Provider {
  Provider(
      {required this.id,
      required this.name,
      required this.email,
      required this.type,
      required this.phone,
      required this.address,
      required this.policeCertificatePath,
      required this.selfiePath,
      required this.nationalId,
      required this.serviceId,
      required this.lat,
      required this.lng});

  final int id;
  final String address;
  final String email;
  final String name;
  final String nationalId;
  final String phone;
  final String policeCertificatePath;
  final String selfiePath;
  final String serviceId;
  final String type;
  final String lat;
  final String lng;
}
