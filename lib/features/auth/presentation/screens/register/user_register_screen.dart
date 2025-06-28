import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/core/utils/validators.dart';
import 'package:kafa2a/core/widgets/default_submit_button.dart';
import 'package:kafa2a/core/widgets/default_text_form_field.dart';
import 'package:kafa2a/core/widgets/ui_utils.dart';
import 'package:kafa2a/features/auth/data/models/register_user_request.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_states.dart';
import 'package:kafa2a/features/auth/presentation/screens/login/widgets/email_form_field.dart';
import 'package:kafa2a/features/auth/presentation/screens/login/widgets/password_form_field.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class UserRegisterScreen extends StatelessWidget {
  UserRegisterScreen({super.key});

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: ColorsManager.blue,
                      width: 1.2.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      14.0,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.h,
                            ),
                          ),
                          Center(
                            child: Text(
                              AppLocalizations.of(context).register,
                              style: AppStyles.onBoarding.copyWith(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppLocalizations.of(context).name,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultTextFormField(
                            controller: nameController,
                            hintText:
                                AppLocalizations.of(context).enterYourName,
                            validator: (name) => Validators.validateNull(
                              name,
                              AppLocalizations.of(context).nameRequired,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppLocalizations.of(context).email,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          EmailFormField(
                            controller: emailController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppLocalizations.of(context).password,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          PasswordFormField(
                            controller: passwordController,
                            validator: (password) =>
                                Validators.validatePassword(password, context),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppLocalizations.of(context).confirmPassword,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          PasswordFormField(
                            controller: confirmPasswordController,
                            validator: (confirmPassword) =>
                                Validators.validateConfirmationPasswords(
                                    passwordController.text,
                                    confirmPassword,
                                    context),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppLocalizations.of(context).phoneNumber,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultTextFormField(
                            controller: phoneNumberController,
                            hintText: AppLocalizations.of(context)
                                .enterYourPhoneNumber,
                            validator: (phoneNumber) => Validators.validateNull(
                                phoneNumber,
                                AppLocalizations.of(context)
                                    .phoneNumberRequired),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: BlocListener<AuthCubit, AuthStates>(
                              listener: (context, state) {
                                if (state is AuthLoadingState) {
                                  UIUtils.showLoading(context);
                                } else if (state is AuthErrorState) {
                                  UIUtils.hideLoading(context);
                                  UIUtils.showMessage(state.error);
                                } else if (state is AuthSuccessState) {
                                  UIUtils.hideLoading(context);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    RoutesManager.homeUser,
                                    (route) => false,
                                  );
                                }
                              },
                              child: DefaultSubmitButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().registerUser(
                                          RegisterUserRequest(
                                            email: emailController.text,
                                            name: nameController.text,
                                            password: passwordController.text,
                                            confirmPassword:
                                                confirmPasswordController.text,
                                            phone: phoneNumberController.text,
                                          ),
                                        );
                                  }
                                },
                                label: AppLocalizations.of(context).register,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).alreadyHaveAnAccount,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        AppLocalizations.of(context).login,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
