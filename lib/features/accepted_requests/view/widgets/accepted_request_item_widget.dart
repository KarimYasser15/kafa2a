import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';

class AcceptedRequestItemWidget extends StatelessWidget {
  const AcceptedRequestItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
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
                    Center(
                        child: Text(
                      "200LE",
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    )),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: ColorsManager.blue,
                        ),
                        Text(
                          "Service Provider: Ziad Tarek",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
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
                onPressed: () {},
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "Chat With Provider",
                    ),
                    Spacer(),
                    Icon(Icons.chat)
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
