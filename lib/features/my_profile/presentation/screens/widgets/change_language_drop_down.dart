import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/features/my_profile/data/models/language.dart';
import 'package:kafa2a/features/my_profile/presentation/cubit/profile_cubit.dart';

class ChangeLanguageDropDown extends StatelessWidget {
  const ChangeLanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.blue,
        ),
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: DropdownButton(
        underline: Container(
          color: Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        borderRadius: BorderRadius.circular(12.r),
        style: GoogleFonts.inter(
            color: Colors.black,
            locale: Locale(context.read<ProfileCubit>().getLanguage()),
            fontSize: 16.sp,
            textStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
            )),
        value: null,
        isExpanded: true,
        items: languages.map((language) {
          return DropdownMenuItem<Language>(
            value: language,
            child: Text(language.name),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            context.read<ProfileCubit>().changeLanguage(value);
          }
        },
        hint: Row(
          children: [
            Spacer(),
            Text(
                languages
                    .firstWhere(
                      (lang) =>
                          lang.code ==
                          context.read<ProfileCubit>().getLanguage(),
                    )
                    .name,
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 16.sp,
                    textStyle: TextStyle(overflow: TextOverflow.ellipsis))),
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
    );
  }
}
