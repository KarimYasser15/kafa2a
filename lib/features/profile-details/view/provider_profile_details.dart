import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafa2a/config/assets_manager.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/features/profile-details/view/widgets/review_item_widget.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class ProviderProfileDetails extends StatelessWidget {
  const ProviderProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).providerPetails),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: ColorsManager.blue,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        AssetsManager.profileImage,
                        width: 100.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Name: Adam Mohamed",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Age: 35",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          "Rating: ",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 200.w,
                          height: 20.h,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Reviews: ",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                    ReviewItemWidget(name: "Ali Ahmed", review: "Good Job"),
                    ReviewItemWidget(name: "Ali Ahmed", review: "Good Job"),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(color: Colors.green, width: 1.2.w))),
            child: Text(
              AppLocalizations.of(context).acceptOffer,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
