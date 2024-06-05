
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: "phone".tr,
          hintText: "017********",
          errorStyle: const TextStyle(fontSize: 12)),
      validator: (value) {
        if (value == null || value == '') {
          return "phone_error".tr;
        } else if (value.toString().length < 11) {
          return "wrong_data_insert_error".tr;
        }
        return null;
      },
    );
  }
}