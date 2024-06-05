
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSuccessful extends StatelessWidget {
  const OrderSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/success.png',
              fit: BoxFit.fill,
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 50),
            CustomTextWidget(
              text: "thanks".tr,
              fontSize: 25,
              fontColor: AppColors.bg1LightColor,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  text: "continue_shopping".tr,
                  onTap: () {
                    Get.offAll(
                      const SplashScreen(),
                      popGesture: true,
                      opaque: false,
                      fullscreenDialog: false,
                      curve: Curves.easeIn,
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 600),
                    );
                  }),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
