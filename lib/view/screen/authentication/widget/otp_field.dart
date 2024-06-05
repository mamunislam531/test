
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: "otp".tr,
          hintText: "*******",
          errorStyle: const TextStyle(fontSize: 12)),
      validator: (value) {
        if (value == null || value == '') {
          return "otp_error".tr;
        } else if (value.toString().length < 4) {
          return "wrong_data_insert_error".tr;
        }
        return null;
      },
    );
  }
}