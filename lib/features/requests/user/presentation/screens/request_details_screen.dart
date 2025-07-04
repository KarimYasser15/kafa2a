import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/features/requests/user/data/models/service_request_model.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/di/service_locator.dart';
import 'package:kafa2a/core/local_data_source/local_data_source.dart';
import 'all_offers_screen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RequestDetailsScreen extends StatefulWidget {
  final int requestId;
  const RequestDetailsScreen({super.key, required this.requestId});

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  ServiceRequestModel? request;
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchRequest();
  }

  Future<void> fetchRequest() async {
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final dio = getIt.get<Dio>();
      final localDataSource = getIt.get<LocalDataSource>();
      final token = await localDataSource.getToken();
      final response = await dio.get(
        ApiConstants.getOffers(widget.requestId),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      setState(() {
        request = ServiceRequestModel.fromJson(response.data);
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).requestDetails),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : request == null
                  ? Center(
                      child: Text(AppLocalizations.of(context).errorMessage))
                  : AnimationLimiter(
                      child: ListView(
                        padding: EdgeInsets.all(20.w),
                        children: [
                          AnimationConfiguration.synchronized(
                            duration: const Duration(milliseconds: 600),
                            child: SlideAnimation(
                              verticalOffset: 60.0,
                              child: FadeInAnimation(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        ColorsManager.blue.withOpacity(0.08),
                                        Colors.white,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(24.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorsManager.blue
                                            .withOpacity(0.18),
                                        blurRadius: 24,
                                        offset: Offset(0, 12),
                                      ),
                                    ],
                                    border: Border.all(
                                        color: ColorsManager.blue, width: 1.2),
                                  ),
                                  padding: EdgeInsets.all(24.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(request!.title,
                                          style: TextStyle(
                                              fontSize: 26.sp,
                                              fontWeight: FontWeight.bold,
                                              color: ColorsManager.blue)),
                                      SizedBox(height: 12.h),
                                      Text(request!.description,
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.grey[700])),
                                      SizedBox(height: 18.h),
                                      _buildDetailRow(
                                          context,
                                          Icons.location_on_rounded,
                                          AppLocalizations.of(context).address,
                                          request!.address ?? '-'),
                                      SizedBox(height: 10.h),
                                      _buildDetailRow(
                                          context,
                                          Icons.category_rounded,
                                          AppLocalizations.of(context).service,
                                          _getServiceName(context)),
                                      SizedBox(height: 10.h),
                                      _buildDetailRow(
                                          context,
                                          Icons.attach_money_rounded,
                                          AppLocalizations.of(context).price,
                                          request!.price),
                                      SizedBox(height: 10.h),
                                      _buildDetailRow(
                                          context,
                                          Icons.access_time_rounded,
                                          AppLocalizations.of(context).time,
                                          _formatDateTime(
                                              context, request!.scheduledAt)),
                                      SizedBox(height: 10.h),
                                      _buildDetailRow(
                                          context,
                                          Icons.info_outline_rounded,
                                          AppLocalizations.of(context).status,
                                          request!.status),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          AnimationConfiguration.synchronized(
                            duration: const Duration(milliseconds: 700),
                            child: SlideAnimation(
                              verticalOffset: 40.0,
                              child: FadeInAnimation(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 400),
                                  child: request!.status == 'accepted'
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AcceptedOfferWidget(),
                                            SizedBox(height: 18.h),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.h),
                                                child: OutlinedButton.icon(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.w,
                                                            vertical: 6.h),
                                                    side: BorderSide(
                                                        color:
                                                            ColorsManager.blue,
                                                        width: 1.2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    // TODO: Navigate to accepted offer details page
                                                  },
                                                  icon: Icon(
                                                      Icons
                                                          .check_circle_rounded,
                                                      color: ColorsManager.blue,
                                                      size: 18.sp),
                                                  label: Text(
                                                    'View Accepted Offer Details',
                                                    style: TextStyle(
                                                      color: ColorsManager.blue,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                AppLocalizations.of(context)
                                                    .offers,
                                                style: TextStyle(
                                                    fontSize: 21.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorsManager.blue)),
                                            SizedBox(height: 12.h),
                                            if ((request!.offers ?? []).isEmpty)
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .noOffersYet,
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                            ...((request!.offers ?? [])
                                                .take(2)
                                                .map((offer) => OfferCardWidget(
                                                      offer: offer,
                                                      onAccept: () {
                                                        // TODO: Implement accept logic
                                                      },
                                                      onReject: () {
                                                        // TODO: Implement reject logic
                                                      },
                                                    ))
                                                .toList()),
                                            if ((request!.offers ?? []).length >
                                                2)
                                              SizedBox(height: 10.h),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.h),
                                                child: OutlinedButton.icon(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.w,
                                                            vertical: 6.h),
                                                    side: BorderSide(
                                                        color:
                                                            ColorsManager.blue,
                                                        width: 1.2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      '/allOffers',
                                                      arguments: request!.id,
                                                    );
                                                  },
                                                  icon: Icon(
                                                      Icons.local_offer_rounded,
                                                      color: ColorsManager.blue,
                                                      size: 18.sp),
                                                  label: Text(
                                                    AppLocalizations.of(context)
                                                        .viewAllOffers,
                                                    style: TextStyle(
                                                      color: ColorsManager.blue,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }

  Widget _buildDetailRow(
      BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: ColorsManager.blue, size: 20.sp),
        SizedBox(width: 8.w),
        Text('$label: ',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        Expanded(child: Text(value, style: TextStyle(fontSize: 15.sp))),
      ],
    );
  }

  String _getServiceName(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'ar') {
      return request!.service.nameAr;
    } else {
      return request!.service.nameEn;
    }
  }

  String _formatDateTime(BuildContext context, String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      final locale = Localizations.localeOf(context);
      final dateFormat = DateFormat('dd/MM/yyyy HH:mm', locale.languageCode);
      return dateFormat.format(dateTime);
    } catch (e) {
      return dateTimeString;
    }
  }
}

class AcceptedOfferWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.blue.withOpacity(0.10),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
        border: Border.all(color: ColorsManager.blue.withOpacity(0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Accepted Offer',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.blue)),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.person, color: ColorsManager.blue, size: 20.sp),
              SizedBox(width: 8.w),
              Text('Provider: Dummy Provider',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.attach_money_rounded,
                  color: Colors.green, size: 20.sp),
              SizedBox(width: 8.w),
              Text('Price: 250 EGP',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.info_outline_rounded,
                  color: Colors.orange, size: 20.sp),
              SizedBox(width: 8.w),
              Text('Status: Accepted',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
            ],
          ),
          SizedBox(height: 8.h),
          Text('Message: Thank you for accepting my offer!',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[700])),
          SizedBox(height: 18.h),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 4,
              ),
              icon: Icon(Icons.payment, size: 22.sp),
              label: Text('Pay',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24.r)),
                  ),
                  isScrollControlled: true,
                  builder: (context) => _PaymentSheet(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 32.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.payments, color: ColorsManager.blue, size: 48.sp),
          SizedBox(height: 16.h),
          Text('Choose Payment Method',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.blue)),
          SizedBox(height: 28.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _PaymentOption(
                icon: Icons.account_balance_wallet_rounded,
                label: 'Pay with Wallet',
                color: Colors.green,
                onTap: () {
                  // TODO: Integrate wallet payment
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Wallet payment coming soon!')),
                  );
                },
                animation: Icons.account_balance_wallet_rounded,
              ),
              _PaymentOption(
                icon: Icons.attach_money_rounded,
                label: 'Pay with Cash',
                color: Colors.orange,
                onTap: () {
                  // TODO: Integrate cash payment
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cash payment coming soon!')),
                  );
                },
                animation: Icons.monetization_on_rounded,
              ),
            ],
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final IconData animation;

  const _PaymentOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: color, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.10),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(animation, color: color, size: 38.sp),
            SizedBox(height: 10.h),
            Icon(icon, color: color, size: 28.sp),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
