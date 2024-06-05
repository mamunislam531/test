import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailOrPhoneLoginTextField extends StatelessWidget {
  const EmailOrPhoneLoginTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:
          InputDecoration(labelText: "email_or_phone".tr, hintText: "youremail@gmail.com / 017********", errorStyle: const TextStyle(fontSize: 12)),
      validator: (value) {
        if (value == null || value == '') {
          return "email_error".tr;
        } else if (!(value.contains("@") && value.contains("."))) {
          if (value.length == 11) {
            return null;
          }
          return "wrong_email_error".tr;
        }
        return null;
      },
    );
  }
}
