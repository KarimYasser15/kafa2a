import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hintText});
  String? Function(String?)? validator;
  TextEditingController controller;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hintText,
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
        ));
  }
}
