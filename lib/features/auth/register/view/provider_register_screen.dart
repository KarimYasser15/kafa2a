import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/validators.dart';
import 'package:kafa2a/core/widgets/default_text_form_field.dart';
import 'package:kafa2a/features/auth/login/view/widgets/email_form_field.dart';
import 'package:kafa2a/features/auth/login/view/widgets/password_form_field.dart';

class ProviderRegisterScreen extends StatefulWidget {
  const ProviderRegisterScreen({super.key});

  @override
  State<ProviderRegisterScreen> createState() => _ProviderRegisterScreenState();
}

class _ProviderRegisterScreenState extends State<ProviderRegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController nationalIdController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  File? image;
  File? cameraImage;

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    this.image = imageTemp;
  }

  Future pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    cameraImage = imageTemp;
  }

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
                            height: 10.h,
                          ),
                          Text(StringsManager.nationalId),
                          SizedBox(height: 10.h),
                          DefaultTextFormField(
                            controller: nationalIdController,
                            hintText: StringsManager.enterYourNationalId,
                            validator: (nationalId) =>
                                Validators.validateNationalId(nationalId),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(StringsManager.address),
                          SizedBox(height: 10.h),
                          DefaultTextFormField(
                            controller: nationalIdController,
                            hintText: StringsManager.enterYourAddress,
                            validator: (address) =>
                                Validators.validateNationalId(address),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(StringsManager.policeClearanceCertificate),
                          SizedBox(
                            height: 10.h,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                pickImageFromGallery();
                              },
                              child: Text(StringsManager.pickImage)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(StringsManager.uploadSelfie),
                          SizedBox(
                            height: 10.h,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                pickImageFromCamera();
                              },
                              child: Text(StringsManager.takeSelfie)),
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
