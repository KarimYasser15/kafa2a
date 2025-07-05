import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/features/reviews/data/models/review_provider_request.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class ReviewProviderScreen extends StatefulWidget {
  const ReviewProviderScreen({
    super.key,
  });

  @override
  State<ReviewProviderScreen> createState() => _ReviewProviderScreenState();
}

class _ReviewProviderScreenState extends State<ReviewProviderScreen> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();
  int serviceRequestId = 0;

  void _submitReview() {
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a rating")),
      );
      return;
    }

    final request = ReviewProviderRequest(
      rating: _rating,
      review: _reviewController.text.trim().isEmpty
          ? null
          : _reviewController.text.trim(),
      serviceRequestId: serviceRequestId,
    );

    // For demo: print request data
    debugPrint('Review Submitted: ${request.toJson()}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Review submitted")),
    );

    // Optionally pop the screen
    Navigator.pushReplacementNamed(context, RoutesManager.homeUser);
  }

  Widget _buildRatingStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        return IconButton(
          icon: Icon(
            Icons.star,
            color: _rating >= starIndex ? Colors.amber : Colors.grey,
            size: 32,
          ),
          onPressed: () {
            setState(() {
              _rating = starIndex;
            });
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).rateProvider),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).howWasYourExperience,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12.h),
            _buildRatingStars(),
            SizedBox(height: 24.h),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).writeAReview,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: _submitReview,
              icon: const Icon(Icons.send),
              label: Text(AppLocalizations.of(context).submit),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
