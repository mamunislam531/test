import 'dart:developer';

 import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    super.key,
    required this.controller,
    required this.onTap,
    required this.password,
  });

  final dynamic controller;
  final VoidCallback onTap;
  final String password;

  @override
  Widget build(BuildContext context) {
    log("message $password");
    return Obx(
      () => TextFormField(
        controller: controller.confirmPasswordController,
        obscureText: controller.isConfirmPasswordEnable.value,
        decoration: InputDecoration(
          labelText: "confirm_password".tr,
          hintText: "********",
          errorStyle: const TextStyle(fontSize: 12),
          suffixIcon: controller.isConfirmPasswordEnable.value
              ? InkWell(
                  onTap: onTap,
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.bg1LightColor,
                  ))
              : InkWell(
                  onTap: onTap,
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: AppColors.bg1LightColor,
                  ),
                ),
        ),
        validator: (value) {
          log("V : $value");
          log("V : ${password.toString() == value.toString()}");
          if (value == null || value == '') {
            return "confirm_pass_error".tr;
          } else if (value.toString() != password) {
            return "pass_did_not_match_error".tr;
          }
          return null;
        },
      ),
    );
  }
}
