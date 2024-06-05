
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class SelectImageDialogue extends StatelessWidget {
  const SelectImageDialogue({
    super.key,
    required this.cameraButton,
    required this.galleryButton,
  });
  final VoidCallback cameraButton;
  final VoidCallback galleryButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomTextWidget(
            text: "Select Image from",
            fontSize: 20,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: cameraButton,
                child: const Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: AppColors.bg1LightColor,
                ),
              ),
              InkWell(
                onTap: galleryButton,
                child: const Icon(
                  Icons.photo,
                  size: 30,
                  color: AppColors.bg1LightColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
