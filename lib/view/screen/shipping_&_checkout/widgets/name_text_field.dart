import 'package:flutter/material.dart';

class ShippingTextField extends StatelessWidget {
  const ShippingTextField({
    super.key,
    required this.controller,
    required this.label,
    this.textInputType,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 1,
      controller: controller,
      style: TextStyle(color: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8)),
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).textTheme.titleSmall?.color),
        errorStyle: const TextStyle(fontSize: 12),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Theme.of(context).focusColor)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Theme.of(context).hintColor)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Theme.of(context).hintColor)),
      ),
      validator: (value) {
        if (value == null || value == '') {
          return "Please Enter $label";
        }
        return null;
      },
    );
  }
}
