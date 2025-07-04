import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/di/service_locator.dart';
import 'package:kafa2a/core/local_data_source/local_data_source.dart';

class AllOffersScreen extends StatefulWidget {
  final int requestId;
  const AllOffersScreen({super.key, required this.requestId});

  @override
  State<AllOffersScreen> createState() => _AllOffersScreenState();
}

class _AllOffersScreenState extends State<AllOffersScreen> {
  List<dynamic> offers = [];
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchOffers();
  }

  Future<void> fetchOffers() async {
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final dio = getIt.get<Dio>();
      final localDataSource = getIt.get<LocalDataSource>();
      final token = await localDataSource.getToken();
      final response = await dio.get(
        '/my-request-offers',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final data = response.data['data'];
      if (data is List) {
        offers = data
            .where((offer) => offer['service_request_id'] == widget.requestId)
            .toList();
      } else {
        offers = [];
      }
      setState(() {
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
        title: Text(AppLocalizations.of(context).offers),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : offers.isEmpty
                  ? Center(
                      child: Text(AppLocalizations.of(context).noOffersYet,
                          style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      padding: EdgeInsets.all(16.w),
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        final offer = offers[index];
                        return OfferCardWidget(
                          offer: offer,
                          onAccept: () {
                            // TODO: Implement accept logic
                          },
                          onReject: () {
                            // TODO: Implement reject logic
                          },
                        );
                      },
                    ),
    );
  }
}

class OfferCardWidget extends StatelessWidget {
  final dynamic offer;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;
  const OfferCardWidget(
      {Key? key, required this.offer, this.onAccept, this.onReject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: ColorsManager.blue, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  offer['provider']?['name'] ?? '-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Spacer(),
                Text(
                  offer['price']?.toString() ?? '-',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            if (offer['message'] != null &&
                offer['message'].toString().isNotEmpty)
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  offer['message'],
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            Row(
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: Colors.green.withOpacity(0.15),
                  child: IconButton(
                    icon: Icon(Icons.check, color: Colors.green),
                    onPressed: onAccept,
                  ),
                ),
                SizedBox(width: 12.w),
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: Colors.red.withOpacity(0.15),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: onReject,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
