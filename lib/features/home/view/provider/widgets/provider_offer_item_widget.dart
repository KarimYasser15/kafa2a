import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/features/home/view/provider/widgets/send_offer_bottom_sheet.dart';

class ProviderOfferItemWidget extends StatefulWidget {
  const ProviderOfferItemWidget({super.key});

  @override
  State<ProviderOfferItemWidget> createState() =>
      _ProviderOfferItemWidgetState();
}

class _ProviderOfferItemWidgetState extends State<ProviderOfferItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: ColorsManager.blue,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: ColorsManager.blue,
                      ),
                      Text(
                        "Ziad Tarek",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                      Spacer(),
                      Text("Requested 2 hrs ago"),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Price: 200LE",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: ColorsManager.blue,
                      ),
                      Text(
                        "Service",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Plumber",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.description, color: ColorsManager.blue),
                      Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Leaking Pipe Under My Kitchen Sink",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.red,
                      ),
                      Text(
                        "Location",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "ElDokki Street, Giza",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded,
                          color: ColorsManager.blue),
                      Text(
                        "Time",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "25-5-2025 - Friday - 2 pm",
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => SendOfferBottomSheet()),
              child: Text(
                StringsManager.offer,
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
