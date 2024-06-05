
  import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(
      {super.key,
      // required this.profileController,
      required this.selectedIndex,
      required this.onTap,
      required this.title,
      required this.value});

  // final ProfileController profileController;
  final int selectedIndex;
  final String title;
  final VoidCallback onTap;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Card(
          color: value.value == selectedIndex ? AppColors.bgLightColor : AppColors.bg2LightColor,
          margin: EdgeInsets.zero,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.transparent)),
          child: SizedBox(
            height: 400,
            width: 300,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  value.value == selectedIndex ? const Icon(Icons.check_box_rounded, size: 20, color: AppColors.bg1LightColor) : const SizedBox(),
                  const SizedBox(width: 5),
                  Flexible(
                    child: CustomTextWidget(
                        text: title,
                        fontColor: value.value == selectedIndex ? AppColors.bg2LightColor : AppColors.bgLightColor,
                        fontSize: value.value == selectedIndex ? 17 : 13),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
