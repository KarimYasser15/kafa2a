import 'package:kafa2a/features/reviews/data/models/review_provider_request.dart';

abstract class ReviewProviderRemoteDataSource {
  Future<void> reviewProvider(
      ReviewProviderRequest paymentRequest, String token);
}
