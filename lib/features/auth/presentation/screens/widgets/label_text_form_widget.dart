import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelTextFormWidget extends StatelessWidget {
  const LabelTextFormWidget({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
