
import 'package:alladin_e_store/controller/ui_controller/checkout.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PricingInfoCard extends StatelessWidget {
  const PricingInfoCard({super.key, required this.checkoutController});
  final CheckoutController checkoutController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSizedBox(height: 30),
        CustomTextWidget(
          text: "pricing_info".tr,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        buildSizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: size.width,
          decoration: BoxDecoration(color: Colors.white.withOpacity(.7), borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "subtotal".tr,
                    fontSize: 18,
                    fontColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                  ),
                  Obx(
                    () => CustomTextWidget(text: "${double.parse(checkoutController.data['price'] ?? "0").toStringAsFixed(2)} ৳", fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "discount".tr,
                    fontSize: 18,
                    fontColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                  ),
                  const CustomTextWidget(text: "0.00  ৳", fontSize: 16),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "shipping_charge".tr,
                    fontSize: 18,
                    fontColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                  ),
                    CustomTextWidget(text: "${checkoutController.data['delivery_charge'] ?? 49}  ৳", fontSize: 16),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "total_payable".tr,
                    fontSize: 18,
                    fontColor: AppColors.bg1LightColor,
                    fontWeight: FontWeight.w500,
                  ),
                  Obx(
                    () => CustomTextWidget(
                      text: "${(double.parse(checkoutController.data['total_amount'] ?? "0") + 1).toStringAsFixed(2)}  ৳",
                      fontSize: 18,
                      fontColor: AppColors.bg1LightColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
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
