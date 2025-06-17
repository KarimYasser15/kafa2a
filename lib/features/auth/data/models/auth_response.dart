import 'user_model.dart';

class AuthResponse {
  AuthResponse({this.message, required this.token, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final String? message;
  final String? token;
  final UserModel? user;
}
