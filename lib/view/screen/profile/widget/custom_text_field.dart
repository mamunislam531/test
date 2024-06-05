 import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.labelText, this.textInputType});

  final TextEditingController controller;
  final String labelText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.cardDarkColor)),
            errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.cardDarkColor)),
            border: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.cardDarkColor)),
            errorStyle: const TextStyle(fontSize: 11),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.bg1LightColor))),
        validator: (value) {
          if (value.toString() == "") {
            return "Field cannot be empty";
          }
          return null;
        },
      ),
    );
  }
}
