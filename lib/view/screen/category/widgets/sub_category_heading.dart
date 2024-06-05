
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';


class SubCategoryHeading extends StatelessWidget {
  const SubCategoryHeading({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: CustomTextWidget(
        text: text,
        maxLine: 2,
        fontWeight: FontWeight.w500,
        fontColor: AppColors.bg1LightColor,
        fontSize: 20,
      ),
    );
  }
}