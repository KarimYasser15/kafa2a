import 'package:dartz/dartz.dart';
import 'package:kafa2a/core/error/failure.dart';
import 'package:kafa2a/features/reviews/data/models/review_provider_request.dart';

abstract class ReviewProviderRepository {
  Future<Either<void, Failure>> reviewProvider(
      ReviewProviderRequest reviewProvider);
}
