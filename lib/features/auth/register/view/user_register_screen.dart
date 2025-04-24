import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/validators.dart';
import 'package:kafa2a/core/widgets/default_text_form_field.dart';
import 'package:kafa2a/features/auth/login/view/widgets/email_form_field.dart';
import 'package:kafa2a/features/auth/login/view/widgets/password_form_field.dart';

class UserRegisterScreen extends StatelessWidget {
  UserRegisterScreen({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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
                          Padding(padding: EdgeInsets.only(top: 10.h)),
                          Center(
                              child: Text(
                            StringsManager.register,
                            style: AppStyles.onBoarding.copyWith(
                                fontSize: 32.sp, fontWeight: FontWeight.normal),
                          )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(StringsManager.name),
                          SizedBox(height: 10.h),
                          DefaultTextFormField(
                            controller: nameController,
                            hintText: StringsManager.enterYourName,
                            validator: (name) => Validators.validateName(name),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(StringsManager.email),
                          SizedBox(height: 10.h),
                          EmailFormField(
                            controller: emailController,
                          ),
                          SizedBox(height: 10.h),
                          Text(StringsManager.password),
                          SizedBox(height: 10.h),
                          PasswordFormField(
                            controller: passwordController,
                            validator: (password) =>
                                Validators.validatePassword(password),
                          ),
                          SizedBox(height: 10.h),
                          Text(StringsManager.confirmPassword),
                          SizedBox(height: 10.h),
                          PasswordFormField(
                            controller: confirmPasswordController,
                            validator: (confirmPassord) =>
                                Validators.validateConfirmationPasswords(
                                    passwordController.text, confirmPassord),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(StringsManager.phoneNumber),
                          SizedBox(height: 10.h),
                          DefaultTextFormField(
                            controller: phoneNumberController,
                            hintText: StringsManager.enterYourPhoneNumber,
                            validator: (phoneNumber) =>
                                Validators.validatePhoneNumber(phoneNumber),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {}
                                },
                                child: Text(StringsManager.register)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringsManager.alreadyHaveAnAccount),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(StringsManager.login)),
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
