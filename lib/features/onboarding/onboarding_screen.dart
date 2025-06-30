import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/assets_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/widgets/default_submit_button.dart';
import 'package:kafa2a/features/my_profile/presentation/screens/widgets/change_language_drop_down.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

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
              AppLocalizations.of(context).welcome,
              style: AppStyles.onBoarding,
            ),
            Text(
              AppLocalizations.of(context).slogan,
              style: AppStyles.onBoarding
                  .copyWith(fontWeight: FontWeight.normal, fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            DefaultSubmitButton(
              label: AppLocalizations.of(context).user,
              onPressed: () => Navigator.pushNamed(context, RoutesManager.login,
                  arguments: UserType.user),
            ),
            SizedBox(
              height: 10.h,
            ),
            DefaultSubmitButton(
              label: AppLocalizations.of(context).serviceProvider,
              onPressed: () => Navigator.pushNamed(context, RoutesManager.login,
                  arguments: UserType.provider),
            ),
            SizedBox(
              height: 10.h,
            ),
            ChangeLanguageDropDown(),
          ],
        ),
      ),
    );
  }
}
