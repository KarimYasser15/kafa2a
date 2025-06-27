class Provider {
  Provider({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.phone,
    required this.address,
    required this.policeCertificatePath,
    required this.selfiePath,
    required this.nationalId,
    required this.service,
  });

  int id;
  String address;
  String email;
  String name;
  String nationalId;
  String phone;
  String policeCertificatePath;
  String selfiePath;
  String service;
  String type;
}
