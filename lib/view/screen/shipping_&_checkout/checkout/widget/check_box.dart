
import 'package:alladin_e_store/controller/ui_controller/payment_methode/ssl_commerz_payment_method.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
    required this.controller,
  });

  final PaymentMethodController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Checkbox(
          value: controller.codValueEnable.value,
          onChanged: (value) {
            if(controller.codValueEnable.value == false){
              Get.defaultDialog(
                  barrierDismissible: false,
                  title: "Remember",
                  titleStyle: const TextStyle(fontSize: 25, fontFamily: "RobotoSerif", fontWeight: FontWeight.w600),
                  content: const CustomTextWidget(
                    text: "You can pay in cash to our courier when you receive the goods at your doorstep.",
                    fontSize: 17,
                    maxLine: 5,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(color: Theme.of(context).canvasColor, borderRadius: BorderRadius.circular(3)),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                            child: const CustomTextWidget(
                              text: "Ok",
                              fontColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]);
              controller.buttonEnable.value = true;
            }else{
              controller.buttonEnable.value = false;
            }
            controller.codValueEnable.value = value!;
          }),
    );
  }
}
