 import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRefreshButton extends StatelessWidget {
  const CustomRefreshButton({super.key, required this.refreshButton, this.height, this.width, this.containerColor, this.iconColorColor});
  final VoidCallback refreshButton;
  final double? height;
  final double? width;
  final Color? containerColor;
  final Color? iconColorColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      width: width ?? MediaQuery.sizeOf(context).width,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: containerColor ?? Colors.transparent, borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: refreshButton,
        child: Icon(
          Icons.refresh,
          color: iconColorColor ?? AppColors.bg1LightColor,
          size: 50,
        ),
      ),
    );
  }
}
