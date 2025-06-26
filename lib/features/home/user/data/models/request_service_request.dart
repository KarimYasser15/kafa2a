class RequestServiceRequest {
  int serviceId;
  String? description;
  String location;
  String scheduledAt;
  int price;
  String title;

  RequestServiceRequest(
      {required this.serviceId,
      this.description,
      required this.location,
      required this.scheduledAt,
      required this.price,
      required this.title});

  Map<String, dynamic> toJson() => {
        'service_id': serviceId,
        'description': description,
        'location': location,
        'scheduled_at': scheduledAt,
        'price': price,
        'title': title,
      };
}
