 import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class DiscountTag extends StatelessWidget {
  const DiscountTag({
    super.key,
    required this.discountType,
    required this.discountPrice,
  });

  final int discountType;
  final double discountPrice;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(310 / 360),
      child: discountPrice.toInt() != 0
          ? Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: discountType == 0
                    ? CustomTextWidget(text: "$discountPrice৳ off", fontColor: Colors.white, fontWeight: FontWeight.w800, fontSize: 9)
                    : CustomTextWidget(text: "${discountPrice.toInt()}% Dis", fontColor: Colors.white, fontWeight: FontWeight.w800, fontSize: 10),
              ),
            )
          : const SizedBox(),
    );
  }
}
