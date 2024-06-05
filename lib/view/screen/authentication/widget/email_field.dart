
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:   InputDecoration(
          labelText: "email".tr,
          hintText: "youremail@gmail.com",
          errorStyle: const TextStyle(fontSize: 12)),
      validator: (value) {
        if (value == null || value == '') {
          return "email_error".tr;
        } else if (!(value.contains("@") &&
            value.contains("."))) {
          return "wrong_email_error".tr;
        }
        return null;
      },
    );
  }
}