import 'dart:io';
import 'package:dio/dio.dart';

class RegisterProviderRequest {
  RegisterProviderRequest({
    required this.email,
    required this.name,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.nationalId,
    required this.address,
    required this.service,
    required this.policeCertificate,
    required this.selfie,
  });

  final String address;
  final String confirmPassword;
  final String email;
  final String name;
  final String nationalId;
  final String password;
  final String phone;
  final File policeCertificate;
  final File selfie;
  final String service;

  FormData toFormData() {
    return FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'service': service,
      'national_id': nationalId,
      'address': address,
      'phone': phone,
      'police_certificate': MultipartFile.fromFileSync(
        policeCertificate.path,
      ),
      'selfie': MultipartFile.fromFileSync(
        selfie.path,
      ),
    });
  }
}
