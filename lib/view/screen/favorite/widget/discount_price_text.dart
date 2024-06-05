
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class DiscountPrice extends StatelessWidget {
  const DiscountPrice({
    super.key,
    required this.regularPrice,
    required this.discountPrice,
    required this.discountType,
    this.regularPriceFontSize,
    this.salePriceFontSize,
  });

  final double regularPrice;
  final double discountPrice;
  final String discountType;
  final double? regularPriceFontSize;
  final double? salePriceFontSize;

  @override
  Widget build(BuildContext context) {
    double salePrice = 0.00;
    if (discountPrice != 0) {
      if (discountType == "0") {
        salePrice = regularPrice - discountPrice;
      } else if (discountType == "1") {
        salePrice = regularPrice - (regularPrice * (discountPrice / 100));
      }
    }

    return discountPrice == 0
        ? Row(
            children: [
              const SizedBox(width: 5),
              CustomTextWidget(
                text: regularPrice.toString(),
                fontSize: regularPriceFontSize ?? 12,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(width: 5),
              const CustomTextWidget(text: "৳", fontSize: 12, fontWeight: FontWeight.w500),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTextWidget(
                      text: salePrice.toString(),
                      fontSize: salePriceFontSize ?? 13,
                      fontColor: AppColors.bg1LightColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(width: 2),
                    const CustomTextWidget(
                      text: "৳",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontColor: AppColors.bg1LightColor,
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    CustomTextWidget(
                      text: regularPrice.toString(),
                      fontSize: regularPriceFontSize ?? 11,
                      fontWeight: FontWeight.w500,
                      textLineThrough: true,
                    ),
                    const SizedBox(width: 2),
                    const CustomTextWidget(
                      textLineThrough: true,
                      text: "৳",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
