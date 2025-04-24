import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/features/auth/login/view/widgets/email_form_field.dart';
import 'package:kafa2a/features/auth/login/view/widgets/password_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {}
                              },
                              child: Text(StringsManager.login)),
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
                      onPressed: () {}, child: Text(StringsManager.register)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
