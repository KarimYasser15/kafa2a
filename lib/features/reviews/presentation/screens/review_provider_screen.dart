import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/core/widgets/ui_utils.dart';
import 'package:kafa2a/features/payment/presentation/cubit/payment_states.dart';
import 'package:kafa2a/features/requests/user/data/models/get_all_requests/all_requests.dart';
import 'package:kafa2a/features/reviews/data/models/review_provider_request.dart';
import 'package:kafa2a/features/reviews/presentation/cubit/review_provider_cubit.dart';
import 'package:kafa2a/features/reviews/presentation/cubit/review_provider_states.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class ReviewProviderScreen extends StatefulWidget {
  const ReviewProviderScreen({super.key, required this.requests});
  final AllRequests requests;

  @override
  State<ReviewProviderScreen> createState() => _ReviewProviderScreenState();
}

class _ReviewProviderScreenState extends State<ReviewProviderScreen> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Widget _buildRatingStars() {
    return SizedBox(
      height: 60.h,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(5, (index) {
          final starIndex = index + 1;
          return GestureDetector(
            onTap: () {
              setState(() {
                _rating = starIndex;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              child: AnimatedScale(
                scale: _rating >= starIndex ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.star_rounded,
                  color: _rating >= starIndex
                      ? Colors.amber
                      : Colors.grey.withOpacity(0.4),
                  size: 48.sp,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).rateProvider,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: ColorsManager.blue,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsManager.blue),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with illustration
            Column(
              children: [
                Icon(
                  Icons.reviews_rounded,
                  size: 100.w,
                  color: ColorsManager.blue.withOpacity(0.8),
                ),
                SizedBox(height: 16.h),
                Text(
                  AppLocalizations.of(context).howWasYourExperience,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Your feedback helps us improve our service",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManager.blue.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Star Rating
            Center(child: _buildRatingStars()),
            if (_rating > 0) ...[
              SizedBox(height: 8.h),
              Text(
                "You rated: $_rating ${_rating == 1 ? 'star' : 'stars'}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorsManager.blue.withOpacity(0.7),
                ),
              ),
            ],
            SizedBox(height: 32.h),

            // Review Text Field
            Text(
              AppLocalizations.of(context).writeAReview,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorsManager.blue,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.blue.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _reviewController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).writeAReview,
                  hintStyle:
                      TextStyle(color: ColorsManager.blue.withOpacity(0.4)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: ColorsManager.blue.withOpacity(0.05),
                  contentPadding: EdgeInsets.all(16.w),
                ),
              ),
            ),
            SizedBox(height: 32.h),

            // Submit Button
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 56.h,
              child: BlocListener<ReviewProviderCubit, ReviewProviderStates>(
                listener: (context, state) {
                  if (state is ReviewProviderLoadingState) {
                    UIUtils.showLoading(context);
                  } else if (state is ReviewProviderErrorState) {
                    UIUtils.hideLoading(context);
                    UIUtils.showMessage(state.error);
                  } else if (state is ReviewProviderSuccessState) {
                    UIUtils.hideLoading(context);
                    Navigator.pushReplacementNamed(
                        context, RoutesManager.homeUser);
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<ReviewProviderCubit>()
                        .reviewProvider(ReviewProviderRequest(
                          rating: _rating,
                          review: _reviewController.text,
                          serviceRequestId: widget.requests.id,
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shadowColor: ColorsManager.blue.withOpacity(0.3),
                  ),
                  child: Text(AppLocalizations.of(context).submit),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
