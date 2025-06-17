import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/utils/validators.dart';
import 'package:kafa2a/features/home/view/provider/widgets/offer_text_form_field.dart';

class SendOfferBottomSheet extends StatefulWidget {
  const SendOfferBottomSheet({super.key});

  @override
  State<SendOfferBottomSheet> createState() => _SendOfferBottomSheetState();
}

class _SendOfferBottomSheetState extends State<SendOfferBottomSheet> {
  TextEditingController offerController = TextEditingController();

  @override
  void dispose() {
    offerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20.h,
          left: 20.w,
          right: 20.w,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        width: double.infinity,
        height: 450.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("500 LE",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Service: Plumber",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Description:",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Leaking Pipe Under My Kitchen Sink",
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Location: ElDokki Street, Giza",
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Time: Monday 8 pm",
              style: TextStyle(fontSize: 25.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
                child: Text("Your Offer Details",
                    style: TextStyle(
                        fontSize: 25.sp, fontWeight: FontWeight.bold))),
            OfferTextFormField(
                controller: offerController,
                validator: (offer) => Validators.validateOffer(offer),
                hintText: "Enter Your Offer"),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(fixedSize: Size(150.w, 45.h)),
                    child: Text(StringsManager.sendOffer)),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style:
                        ElevatedButton.styleFrom(fixedSize: Size(150.w, 45.h)),
                    child: Text(StringsManager.close))
              ],
            )
          ],
        ),
      ),
    );
  }
}
