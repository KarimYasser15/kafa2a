import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/widgets/ui_utils.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_states.dart';
import 'package:kafa2a/features/my_profile/presentation/screens/provider/widgets/provider_profile_data_widget.dart';
import 'package:kafa2a/features/my_profile/presentation/screens/widgets/change_language_drop_down.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).myProfile,
          style: AppStyles.title,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50.r),
                                      child: Image.network(
                                        '${ApiConstants.baseImageUrl}${context.read<AuthCubit>().provider!.selfiePath}',
                                        width: 100.w,
                                        height: 100.w,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Icon(Icons.person,
                                              size: 100.w, color: Colors.grey);
                                        },
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return SizedBox(
                                            width: 100.w,
                                            height: 100.w,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          );
                                        },
                                      ),
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
                                        AppLocalizations.of(context)
                                            .editProfilePhoto,
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
                            ProviderProfileDataWidget(
                                label: AppLocalizations.of(context).name,
                                data: context.read<AuthCubit>().provider!.name),
                            ProviderProfileDataWidget(
                                label: AppLocalizations.of(context).email,
                                data:
                                    context.read<AuthCubit>().provider!.email),
                            ProviderProfileDataWidget(
                                label: AppLocalizations.of(context).phoneNumber,
                                data:
                                    context.read<AuthCubit>().provider!.phone),
                            ProviderProfileDataWidget(
                                label: AppLocalizations.of(context).address,
                                data: context
                                    .read<AuthCubit>()
                                    .provider!
                                    .address),
                            ProviderProfileDataWidget(
                                label: AppLocalizations.of(context).service,
                                data: context
                                    .read<AuthCubit>()
                                    .provider!
                                    .serviceId
                                    .toString()),
                          ],
                        ),
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
