import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/assets_manager.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/core/widgets/ui_utils.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_states.dart';
import 'package:kafa2a/features/my_profile/presentation/screens/widgets/change_language_drop_down.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).myProfile,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.asset(
                      AssetsManager.appLogo,
                      height: 200.h,
                      width: 200.h,
                    ),
                  ),
                  Container(
                    width: double.infinity,
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
                          Text(
                            "${AppLocalizations.of(context).name}: ${context.read<AuthCubit>().user!.name}",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "${AppLocalizations.of(context).email}: ${context.read<AuthCubit>().user!.email}",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "${AppLocalizations.of(context).phoneNumber}: ${context.read<AuthCubit>().user!.phone}",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ChangeLanguageDropDown(),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocListener<AuthCubit, AuthStates>(
                    listener: (context, state) {
                      if (state is AuthLoadingState) {
                        UIUtils.showLoading(context);
                      } else if (state is AuthErrorState) {
                        UIUtils.hideLoading(context);
                        UIUtils.showMessage(state.error);
                      } else if (state is AuthSuccessState) {
                        UIUtils.hideLoading(context);
                        Navigator.of(context)
                            .pushReplacementNamed(RoutesManager.onBoarding);
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().logOut();
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.red),
                          backgroundColor: Colors.red),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(AppLocalizations.of(context).logOut),
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
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
