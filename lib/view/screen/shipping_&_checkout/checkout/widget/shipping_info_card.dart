
import 'package:alladin_e_store/controller/ui_controller/checkout.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingInfoCard extends StatelessWidget {
  const ShippingInfoCard({super.key, required this.controller});
  final CheckoutController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSizedBox(height: 10),
        CustomTextWidget(
          text: "shipping_info".tr,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        buildSizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: size.width,
          decoration: BoxDecoration(color: Colors.white.withOpacity(.7), borderRadius: BorderRadius.circular(10)),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: controller.data["customer_name"] ?? "",
                  fontSize: 17,
                  fontColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                ),
                CustomTextWidget(
                  text: controller.data["customer_email"] ?? "",
                  fontSize: 14,
                  fontColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                ),
                CustomTextWidget(
                  text: controller.data["customer_phone"] ?? "",
                  fontSize: 14,
                  fontColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                ),
                CustomTextWidget(
                  text:
                      "${controller.data["street"]},${controller.data["city"]},${controller.data["zip_code"]},${controller.data["district"]},${controller.data["division"]}",
                  fontSize: 14,
                  fontColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                ),
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
