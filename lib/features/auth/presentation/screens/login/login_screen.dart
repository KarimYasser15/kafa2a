import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/utils/validators.dart';
import 'package:kafa2a/core/widgets/default_submit_button.dart';
import 'package:kafa2a/core/widgets/ui_utils.dart';
import 'package:kafa2a/features/auth/data/models/login_request.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_states.dart';
import 'package:kafa2a/features/auth/presentation/screens/login/widgets/email_form_field.dart';
import 'package:kafa2a/features/auth/presentation/screens/login/widgets/password_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String userType =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border:
                        Border.all(color: ColorsManager.blue, width: 1.2.w)),
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20.h)),
                        Center(
                            child: Text(
                          StringsManager.login,
                          style: AppStyles.onBoarding.copyWith(
                              fontSize: 32.sp, fontWeight: FontWeight.normal),
                        )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(StringsManager.email),
                        SizedBox(height: 10.h),
                        EmailFormField(
                          controller: emailController,
                        ),
                        SizedBox(height: 20.h),
                        Text(StringsManager.password),
                        SizedBox(height: 10.h),
                        PasswordFormField(
                          controller: passwordController,
                          validator: (password) =>
                              Validators.validatePassword(password),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: BlocListener<AuthCubit, AuthStates>(
                            listener: (_, state) {
                              if (state is AuthLoadingState) {
                                UIUtils.showLoading(context);
                              } else if (state is AuthErrorState) {
                                UIUtils.hideLoading(context);
                                UIUtils.showMessage(state.error);
                              } else if (state is AuthSuccessState) {
                                UIUtils.hideLoading(context);
                                if (userType == UserType.user) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    RoutesManager.homeUser,
                                    (route) => false,
                                  );
                                } else {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    RoutesManager.homeProvider,
                                    (route) => false,
                                  );
                                }
                              }
                            },
                            child: DefaultSubmitButton(
                                onPressed: () {
                                  if (userType == UserType.user) {
                                    context.read<AuthCubit>().loginUser(
                                          LoginRequest(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text),
                                        );
                                  } else {
                                    context.read<AuthCubit>().loginProvider(
                                          LoginRequest(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text),
                                        );
                                  }
                                },
                                label: StringsManager.login),
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
                  Text(StringsManager.dontHaveAnAccount),
                  TextButton(
                      onPressed: () {
                        if (userType == UserType.user) {
                          Navigator.pushNamed(
                              context, RoutesManager.registerUser);
                        } else {
                          Navigator.pushNamed(
                              context, RoutesManager.registerProvider);
                        }
                      },
                      child: Text(StringsManager.register)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
