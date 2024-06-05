
import 'package:alladin_e_store/controller/ui_controller/checkout.dart';
import 'package:alladin_e_store/controller/ui_controller/payment_methode/bkash_payment_method.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodInfo extends StatelessWidget {
  const PaymentMethodInfo({super.key, required this.controller, required this.checkoutController});
  final BkashPaymentMethodController controller;
  final CheckoutController checkoutController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSizedBox(height: 25),
        CustomTextWidget(
          text: "payment_method".tr,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        buildSizedBox(height: 10),
        Obx(
          () => Container(
            width: size.width,
            decoration: BoxDecoration(color: Colors.white.withOpacity(.7), borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   child: Container(
                //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //     decoration: BoxDecoration(
                //         color: AppColors.bg1LightColor.withOpacity(.2),
                //         borderRadius: BorderRadius.circular(10),
                //         border: Border.all(color: checkoutController.selectMethode.value == "bkash" ? Colors.red : Colors.transparent)),
                //     child: InkWell(
                //       onTap: () {
                //         checkoutController.selectMethode.value = "bkash";
                //         controller.buttonEnable.value = false;
                //         controller.bKashPayment(context: context, payAmount: checkoutController.payableAmount.value, data: checkoutController.data);
                //         // controller.sslCommerzCustomizedCall();
                //       },
                //       child: Image.asset(
                //         "assets/images/bkash_logo.png",
                //         height: 100,
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.bg1LightColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: checkoutController.selectMethode.value == "cod" ? Colors.red : Colors.transparent)),
                    child: InkWell(
                      onTap: () {
                        checkoutController.selectMethode.value = "cod";
                        controller.buttonEnable.value = true;
                        // controller.sslCommerzCustomizedCall();
                      },
                      child: Image.asset(
                        "assets/images/cod.png",
                        height: 100,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Custom Size Box
  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
