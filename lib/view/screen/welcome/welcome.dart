
import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:alladin_e_store/controller/ui_controller/profile.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/authentication/sign_in.dart';
import 'package:alladin_e_store/view/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:alladin_e_store/view/screen/profile/widget/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height / 2,
                    width: size.width,
                    //color: AppColors.bg1LightColor.withOpacity(.89),
                    child: Image.asset(
                      'assets/images/welcome.png',
                      height: size.height / 2,
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: CustomSwitch(
                      onTap: () {
                        profileController.languageEN.value ? Get.updateLocale(const Locale("en", "US")) : Get.updateLocale(const Locale("bn", "BD"));
                        profileController.languageEN.value
                            ? LocalData().writeData(key: "languageType", value: "EN")
                            : LocalData().writeData(key: "languageType", value: "BN");
                        profileController.languageEN.value = !profileController.languageEN.value;

                      },
                      onText: "EN",
                      offText: "BN",
                      value: profileController.languageEN,
                    ),
                  ),
                ],
              ),
              CustomTextWidget(
                text: "welcome_heading".tr,
                maxLine: 2,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontColor: AppColors.bg1LightColor,
                textAlign: TextAlign.center,
              ),
              buildSizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: "welcome_quotes".tr,
                      maxLine: 5,
                      fontColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextWidget(
                          text: "welcome_quotes_writer".tr,
                          maxLine: 5,
                          fontColor: Theme.of(context).textTheme.displayMedium?.color?.withOpacity(.8),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    buildSizedBox(height: size.height / 30),
                    CustomButton(
                        text: "welcome_button".tr,
                        onTap: () {
                          Get.to(() => const SignIn());
                        }),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const BottomNavBarScreen());
                      },
                      child: CustomTextWidget(
                        text: "skip".tr,
                        maxLine: 5,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.bg1LightColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
