import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/assets_manager.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/features/my_profile/models/language.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Language> languages = [
      Language(name: "English", code: "en"),
      Language(name: "العربية", code: "ar")
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 10.w, right: 10.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringsManager.myProfile,
                    style: AppStyles.title,
                  ),
                  SizedBox(
                    height: 10.h,
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
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AssetsManager.profileImage,
                                      width: 100.w,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.r)),
                                      onTap: () {},
                                      child: Text(
                                        StringsManager.editProfilePhoto,
                                        style: TextStyle(
                                            color: ColorsManager.blue,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Name: Saif Ahmed",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Email: saif@gmail.com",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Phone Number: 01117037134",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorsManager.blue,
                        ),
                        borderRadius: BorderRadius.circular(12.r)),
                    width: 320.w,
                    child: DropdownButton(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      borderRadius: BorderRadius.circular(12.r),
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 16.sp,
                          textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis)),
                      value: null,
                      isExpanded: true,
                      items: languages.map((language) {
                        return DropdownMenuItem<Language>(
                          value: language,
                          child: Text(language.name),
                        );
                      }).toList(),
                      onChanged: (value) {},
                      hint: Row(
                        children: [
                          Spacer(),
                          Text(StringsManager.changeLanguage,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  textStyle: TextStyle(
                                      overflow: TextOverflow.ellipsis))),
                          Spacer(),
                          Icon(
                            Icons.language,
                            color: ColorsManager.blue,
                            size: 20,
                            weight: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.red),
                        backgroundColor: Colors.red),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(StringsManager.logOut),
                        Spacer(),
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 20,
                          weight: 30,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
