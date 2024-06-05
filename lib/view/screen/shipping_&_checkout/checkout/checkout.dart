
import 'package:alladin_e_store/controller/ui_controller/checkout.dart';
import 'package:alladin_e_store/controller/ui_controller/payment_methode/bkash_payment_method.dart';
import 'package:alladin_e_store/view/common_widget/custom_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_loading_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/shipping_&_checkout/order_success/order_successful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'widget/cancel_button.dart';
import 'widget/disable_button.dart';
import 'widget/payment_method_info.dart';
import 'widget/pricing_info_card.dart';
import 'widget/shipping_info_card.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.put(CheckoutController());
    BkashPaymentMethodController controller = Get.put(BkashPaymentMethodController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("summary".tr),
      ),
      backgroundColor: Colors.brown,
      body: Card(
        shadowColor: Colors.greenAccent,
        surfaceTintColor: Colors.green,
        shape: const OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
        margin: EdgeInsets.zero,
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shipping Information
                  ShippingInfoCard(controller: checkoutController),

                  // Pricing Information
                  PricingInfoCard(
                    checkoutController: checkoutController,
                  ),

                  // Payment Card
                  PaymentMethodInfo(
                    controller: controller,
                    checkoutController: checkoutController,
                  ),
                  // Obx(
                  //   () => controller.trxID.value != ""
                  //       ? const SizedBox()
                  //       : PaymentMethodInfo(
                  //           controller: controller,
                  //           checkoutController: checkoutController,
                  //         ),
                  // ),

                  // // Cash On Delivery Button
                  // buildSizedBox(height: 15),
                  // Obx(() => controller.paymentDone.value
                  //     ? Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 5),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const CustomTextWidget(
                  //               text: "Cash On Delivery",
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w600,
                  //               fontColor: Colors.deepOrangeAccent,
                  //             ),
                  //             SizedBox(height: 10, child: CheckBox(controller: controller))
                  //           ],
                  //         ),
                  //       )
                  //     : const SizedBox()),

                  // Payment Button
                  buildSizedBox(height: 10),
                  Obx(
                    () => controller.buttonEnable.value
                        ? controller.isLoading.value
                            ? const CustomLoadingButton()
                            : CustomButton(
                                text: 'continue'.tr,
                                onTap: () async {
                                  buildDefaultDialog(confirmButton: () async {
                                    Get.back();
                                    controller.isLoading.value = true;
                                    await EasyLoading.show();
                                    bool status = await checkoutController.orderStoreService();
                                    controller.isLoading.value = false;
                                    if (status) {
                                      Get.offAll(() => const OrderSuccessful());
                                    }
                                  });
                                },
                              )
                        : const DisableButton(),
                  ),
                  Obx(
                    () => controller.trxID.value != ""
                        ? controller.isLoading.value
                            ? const CustomLoadingButton()
                            : CustomButton(
                                text: 'continue'.tr,
                                onTap: () async {
                                  controller.isLoading.value = true;
                                  await EasyLoading.show();
                                  bool status = await checkoutController.orderStoreService(tranID: controller.trxID.value);
                                  controller.isLoading.value = false;
                                  if (status) {
                                    Get.offAll(() => const OrderSuccessful());
                                  }
                                },
                              )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom Dialogue
  Future<dynamic> buildDefaultDialog({required VoidCallback confirmButton}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: "payment_confirmation".tr,
        titleStyle: const TextStyle(fontSize: 25, fontFamily: "RobotoSerif", fontWeight: FontWeight.w600),
        content: CustomTextWidget(
          text: "payment_confirmation_message".tr,
          fontSize: 17,
          maxLine: 5,
        ),
        actions: [
          ConfirmCancelDialogueButton(
            confirmButton: confirmButton,
          )
        ]);
  }

  // Common Sized Box
  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
