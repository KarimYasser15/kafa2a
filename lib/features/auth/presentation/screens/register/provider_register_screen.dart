import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_styles.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/messages.dart';
import 'package:kafa2a/core/utils/validators.dart';
import 'package:kafa2a/core/widgets/default_text_form_field.dart';
import 'package:kafa2a/core/widgets/ui_utils.dart';
import 'package:kafa2a/features/auth/data/models/register_provider_request.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_states.dart';
import 'package:kafa2a/features/auth/presentation/screens/login/widgets/email_form_field.dart';
import 'package:kafa2a/features/auth/presentation/screens/login/widgets/password_form_field.dart';

class ProviderRegisterScreen extends StatefulWidget {
  const ProviderRegisterScreen({super.key});

  @override
  State<ProviderRegisterScreen> createState() => _ProviderRegisterScreenState();
}

class _ProviderRegisterScreenState extends State<ProviderRegisterScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
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
                    borderRadius: BorderRadius.circular(
                      12.r,
                    ),
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
                              StringsManager.register,
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
                            StringsManager.name,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultTextFormField(
                            controller: nameController,
                            hintText: StringsManager.enterYourName,
                            validator: (name) => Validators.validateNull(
                                name, Messages.nameRequired),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            StringsManager.email,
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
                            StringsManager.password,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          PasswordFormField(
                            controller: passwordController,
                            validator: (password) =>
                                Validators.validatePassword(password),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            StringsManager.confirmPassword,
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
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            StringsManager.phoneNumber,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultTextFormField(
                            controller: phoneNumberController,
                            hintText: StringsManager.enterYourPhoneNumber,
                            validator: (phoneNumber) => Validators.validateNull(
                                phoneNumber, Messages.phoneNumberRequired),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            StringsManager.nationalId,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultTextFormField(
                            controller: nationalIdController,
                            hintText: StringsManager.enterYourNationalId,
                            validator: (nationalId) => Validators.validateNull(
                                nationalId, Messages.nationalIdRequired),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            StringsManager.address,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultTextFormField(
                            controller: addressController,
                            hintText: StringsManager.enterYourAddress,
                            validator: (address) => Validators.validateNull(
                                address, Messages.addressRequired),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            StringsManager.policeClearanceCertificate,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<AuthCubit>().pickImageFromGallery();
                            },
                            child: Text(
                              StringsManager.pickImage,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            StringsManager.uploadSelfie,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<AuthCubit>().pickImageFromCamera();
                            },
                            child: Text(
                              StringsManager.takeSelfie,
                            ),
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
                                    RoutesManager.homeProvider,
                                    (route) => false,
                                  );
                                }
                              },
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().registerProvider(
                                          RegisterProviderRequest(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            confirmPassword:
                                                confirmPasswordController.text,
                                            phone: phoneNumberController.text,
                                            nationalId:
                                                nationalIdController.text,
                                            address: addressController.text,
                                            service: 'Cleaning',
                                            policeCertificate:
                                                context.read<AuthCubit>().image,
                                            selfie: context
                                                .read<AuthCubit>()
                                                .cameraImage,
                                          ),
                                        );
                                  }
                                },
                                child: Text(
                                  StringsManager.register,
                                ),
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
                      StringsManager.alreadyHaveAnAccount,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        StringsManager.login,
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
