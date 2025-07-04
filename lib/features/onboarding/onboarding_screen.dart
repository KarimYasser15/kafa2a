import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/assets_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/widgets/default_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.appLogo),
            Text(
              "${StringsManager.welcome},",
              style: AppStyles.onBoarding,
            ),
            Text(
              StringsManager.slogan,
              style: AppStyles.onBoarding
                  .copyWith(fontWeight: FontWeight.normal, fontSize: 15.sp),
            ),
            DefaultElevatedButton(
              label: StringsManager.user,
              onPressed: () => Navigator.pushNamed(context, RoutesManager.login,
                  arguments: UserType.user),
            ),
            SizedBox(
              height: 10.h,
            ),
            DefaultElevatedButton(
              label: StringsManager.serviceProvider,
              onPressed: () => Navigator.pushNamed(context, RoutesManager.login,
                  arguments: UserType.provider),
            )
          ],
        ),
      ),
    );
  }
}
