class ApiConstants {
  static const String baseUrl = 'http://10.0.2.2:8000/api/';
  static const String logOutEndPoint = 'logout';
  static const String loginProviderEndPoint = 'token';
  static const String loginUserEndPoint = 'token';
  static const String registerProviderEndPoint = 'register-provider';
  static const String registerUserEndPoint = 'register';
  static const String getCategories = 'categories';
  static const String requestService = 'service-requests';
  static const String getAllRequests = 'requests';
  static sendOffer(int id) => 'request/$id/offer';
  static const String getAcceptedUserOffers = "/accepted-offers";
  static const String getAllPendingUserRequests = "service-requests";
}

class CacheConstants {
  static const String token = "token";
  static const String language = "language";
  static const String latitude = 'lat';
  static const String longitude = 'lng';
}

class UserType {
  static const String user = "user";
  static const String provider = "provider";
}
