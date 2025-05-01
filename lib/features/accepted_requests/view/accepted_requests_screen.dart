import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/features/accepted_requests/view/widgets/accepted_request_item_widget.dart';

class AcceptedRequestsScreen extends StatelessWidget {
  const AcceptedRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.acceptedRequests),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 70.h),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: AcceptedRequestItemWidget(),
            ),
            itemCount: 5,
          ),
        ));
  }
}
