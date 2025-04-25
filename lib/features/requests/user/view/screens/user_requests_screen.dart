import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/features/requests/user/view/widgets/request_item_widget.dart';

class UserRequestsScreen extends StatelessWidget {
  const UserRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 10.w, right: 10.w),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          StringsManager.myRequests,
                          style: AppStyles.title,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        PopupMenuButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              side: BorderSide(color: ColorsManager.blue)),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Row(
                                children: [Text(StringsManager.open)],
                              ),
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [Text(StringsManager.accepted)],
                              ),
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [Text(StringsManager.completed)],
                              ),
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [Text(StringsManager.cancelled)],
                              ),
                              onTap: () {},
                            )
                          ],
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_alt_rounded,
                                color: Colors.black,
                              ),
                              Text(StringsManager.filter)
                            ],
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 10.h),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: RequestItemWidget(),
                      ),
                      itemCount: 5,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
