 import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.onTap,
    this.fieldName,
  });

  final dynamic controller;
  final String? fieldName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller.passwordController,
        obscureText: controller.isPasswordEnable.value,
        decoration: InputDecoration(
          labelText: "password".tr,
          hintText: "********",
          errorStyle: const TextStyle(fontSize: 12),
          suffixIcon: controller.isPasswordEnable.value
              ? InkWell(
                  onTap: onTap,
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.bg1LightColor,
                  ),
                )
              : InkWell(
                  onTap: onTap,
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: AppColors.bg1LightColor,
                  ),
                ),
        ),
        validator: (value) {
          if (value == null || value == '') {
            return "password_error".tr;
          } else if (value.toString().length < 6 && fieldName == "signUp") {
            return "password_length_error".tr;
          }
          return null;
        },
      ),
    );
  }
}
