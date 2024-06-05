
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.onTap,
    required this.onText,
    required this.offText,
    required this.value,
  });

  final VoidCallback onTap;
  final String onText;
  final String offText;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Obx(() => Container(
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                      color: value.value == false
                          ? AppColors.bg1LightColor
                          : Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.transparent)),
                  child: CustomTextWidget(
                    text: onText,
                    fontColor: value.value == true
                        ? AppColors.bg1LightColor
                        : AppColors.bgLightColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                      color: value.value == true
                          ? AppColors.bg1LightColor
                          : AppColors.bgLightColor,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.transparent)),
                  child: CustomTextWidget(
                    text: offText,
                    fontColor: value.value == false
                        ? AppColors.bg1LightColor
                        : Theme.of(context).cardColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
