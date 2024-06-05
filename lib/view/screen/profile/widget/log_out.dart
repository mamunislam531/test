 import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOut extends StatelessWidget {
  const LogOut({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: .4,
        surfaceTintColor: Colors.transparent,
        shape: const OutlineInputBorder(borderSide: BorderSide.none),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: CustomTextWidget(text: "log_out".tr),
            ),
            const Icon(
              Icons.logout,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
