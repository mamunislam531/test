import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmCancelDialogueButton extends StatelessWidget {
  const ConfirmCancelDialogueButton({
    super.key,
    required this.confirmButton,
  });

  final VoidCallback confirmButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).canvasColor, borderRadius: BorderRadius.circular(3)),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              padding: const EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              child: CustomTextWidget(
                text: "cancel".tr,
                fontColor: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: confirmButton,
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).textTheme.bodySmall?.color, borderRadius: BorderRadius.circular(3)),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              padding: const EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              child: CustomTextWidget(
                text: "confirm".tr,
                fontColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
