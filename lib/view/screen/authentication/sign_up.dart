
import 'package:alladin_e_store/controller/ui_controller/authentication/sign_up.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/utils/common_function/common_snackbar_message.dart';
import 'package:alladin_e_store/utils/common_function/internet_connection_checker.dart';
import 'package:alladin_e_store/view/common_widget/custom_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_loading_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'sign_in.dart';
import 'widget/confirm_password_field.dart';
import 'widget/email_field.dart';
import 'widget/password_field.dart';
import 'widget/phone_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.sizeOf(context).width,
                color: AppColors.bg1LightColor.withOpacity(.89)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSizedBox(height: size.height / 15),
                Image.asset(
                  "assets/images/splash_logo.png",
                  height: size.height / 4.5,
                  width: size.width / 1.2,
                  fit: BoxFit.fill,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(color: AppColors.cardLightColor, borderRadius: const BorderRadius.all(Radius.circular(20)), boxShadow: [
                    BoxShadow(offset: const Offset(0, 3), color: AppColors.appbarLightColor.withOpacity(.5), blurRadius: 16),
                  ]),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: "sign_up".tr,
                        fontColor: AppColors.bg1LightColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                      buildSizedBox(height: 10),
                      Form(
                        key: signUpController.signUpFormKey,
                        child: Column(
                          children: [
                            EmailTextField(
                              controller: signUpController.emailController,
                            ),
                            PhoneTextField(
                              controller: signUpController.phoneController,
                            ),
                            PasswordTextField(
                              controller: signUpController,
                              fieldName: "signUp",
                              onTap: () {
                                signUpController.isPasswordEnable.value = !signUpController.isPasswordEnable.value;
                              },
                            ),
                            ConfirmPasswordTextField(
                              controller: signUpController,
                              password: signUpController.passwordController.text,
                              onTap: () {
                                signUpController.isConfirmPasswordEnable.value = !signUpController.isConfirmPasswordEnable.value;
                              },
                            )
                          ],
                        ),
                      ),
                      buildSizedBox(height: 10),
                      Obx(
                        () => signUpController.isLoading.value
                            ? const CustomLoadingButton(
                                buttonWidth: 150,
                              )
                            : CustomButton(
                                text: "sign_up".tr,
                                buttonWidth: 150,
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  if (!signUpController.signUpFormKey.currentState!.validate()) {
                                    return;
                                  }
                                  if (!await ConnectionChecker.checkConnection()) {
                                    CommonSnackBarMessage.noInternetConnection();
                                    return;
                                  }
                                  signUpController.isLoading.value = true;
                                  await EasyLoading.show();
                                  bool status = await signUpController.signUpService();
                                  signUpController.isLoading.value = false;
                                  if (status) {
                                    Get.off(const SignIn());
                                  }
                                },
                              ),
                      ),
                      buildSizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(text: "Already have an account?  ".tr),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.off(const SignIn());
                            },
                            child: CustomTextWidget(
                              text: "sign_in".tr,
                              fontColor: AppColors.appbarLightColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
