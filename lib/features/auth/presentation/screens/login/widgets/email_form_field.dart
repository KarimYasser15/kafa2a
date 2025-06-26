import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/utils/validators.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => Validators.validateEmail(value),
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
          hintText: StringsManager.enterYourEmail,
          hintStyle: TextStyle(fontSize: 14.sp),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.black54),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: ColorsManager.blue),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.blue),
            borderRadius: BorderRadius.circular(12.r),
          ),
          suffixIcon: Icon(
            Icons.email_outlined,
            color: ColorsManager.blue,
          )),
    );
  }
}
