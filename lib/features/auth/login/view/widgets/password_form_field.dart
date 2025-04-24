import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/validators.dart';

class PasswordFormField extends StatefulWidget {
  PasswordFormField({super.key, required this.controller});
  TextEditingController controller;
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isVisible = true;

  Icon visibilityIcon =
      Icon(Icons.visibility_off_outlined, color: ColorsManager.blue);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        validator: (value) => Validators.validatePassword(value),
        obscureText: isVisible,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
            hintText: StringsManager.enterYourPassword,
            hintStyle: TextStyle(fontSize: 14.sp),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.black54),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.red.shade900),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorsManager.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.blue),
              borderRadius: BorderRadius.circular(12.r),
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  if (isVisible) {
                    visibilityIcon = Icon(Icons.visibility_outlined,
                        color: ColorsManager.blue);
                    isVisible = false;
                  } else {
                    visibilityIcon = Icon(
                      Icons.visibility_off_outlined,
                      color: ColorsManager.blue,
                    );
                    isVisible = true;
                  }
                  setState(() {});
                },
                icon: visibilityIcon)));
  }
}
