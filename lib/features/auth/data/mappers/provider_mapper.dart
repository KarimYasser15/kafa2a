import 'package:kafa2a/core/models/user_model.dart';
import 'package:kafa2a/features/auth/domain/entities/provider.dart';

extension ProviderMapper on UserModel {
  Provider get toProviderEntity => Provider(
      id: id,
      name: name,
      email: email,
      type: type,
      phone: phone,
      address: address!,
      policeCertificatePath: policeCertificatePath!,
      selfiePath: selfiePath!,
      nationalId: nationalId!,
      service: service!,
      lat: lat!,
      lng: lng!);
}
