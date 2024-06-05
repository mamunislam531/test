
import 'package:alladin_e_store/controller/ui_controller/shipping.dart';
import 'package:alladin_e_store/view/common_widget/custom_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/shipping_&_checkout/checkout/checkout.dart';
import 'package:alladin_e_store/view/screen/shipping_&_checkout/widgets/name_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shipping extends StatelessWidget {
  const Shipping({super.key});

  @override
  Widget build(BuildContext context) {
    ShippingController shippingController = Get.put(ShippingController());
    return Scaffold(
      appBar: AppBar(
        title: Text("shipping_info".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: shippingController.shippingFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Customer Information
                buildSizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "personal_info".tr,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    buildSizedBox(height: 5),
                    ShippingTextField(
                      controller: shippingController.nameController,
                      label: 'name'.tr,
                    ),
                    buildSizedBox(height: 10),
                    ShippingTextField(
                      controller: shippingController.mailController,
                      textInputType: TextInputType.emailAddress,
                      label: 'email'.tr,
                    ),
                    buildSizedBox(height: 10),
                    ShippingTextField(
                      controller: shippingController.phoneController,
                      label: 'phone'.tr,
                      textInputType: TextInputType.number,
                    ),
                  ],
                ),

                // Shipping Information
                buildSizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "shipping_address".tr,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    buildSizedBox(height: 5),
                    ShippingTextField(
                      controller: shippingController.houseController,
                      label: 'house/road address'.tr,
                    ),
                    buildSizedBox(height: 10),
                    ShippingTextField(
                      controller: shippingController.postalCodeController,
                      textInputType: TextInputType.number,
                      label: 'post_code'.tr,
                    ),
                    buildSizedBox(height: 10),
                    ShippingTextField(
                      controller: shippingController.cityController,
                      label: 'city'.tr,
                      textInputType: TextInputType.text,
                    ),
                    buildSizedBox(height: 10),
                    ShippingTextField(
                      controller: shippingController.districtController,
                      label: 'district'.tr,
                      textInputType: TextInputType.text,
                    ),
                    buildSizedBox(height: 10),
                    ShippingTextField(
                      controller: shippingController.divisionController,
                      label: 'division'.tr,
                      textInputType: TextInputType.text,
                    ),
                  ],
                ),

                // Button
                buildSizedBox(height: 20),
                CustomButton(
                    text: "next".tr,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (!shippingController.shippingFormKey.currentState!.validate()) {
                        return;
                      }

                      Get.to(const Checkout(), arguments: shippingController.shippingInfoData());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Common Sized Box
  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
