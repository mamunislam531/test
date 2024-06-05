 import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.controller});
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Obx(
                () => SizedBox(
                  // height: 210,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStatePropertyAll(
                                controller.filterIndex.value == 0
                                    ? Colors.red
                                    : Colors.white),
                            value: controller.filterIndex.value == 0
                                ? true
                                : false,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              controller.filterIndex.value = 0;
                              controller.filterIndexName.value = "Default";
                              Get.back();
                            },
                          ),
                          const CustomTextWidget(text: "Default"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStatePropertyAll(
                                controller.filterIndex.value == 1
                                    ? Colors.red
                                    : Colors.white),
                            value: controller.filterIndex.value == 1
                                ? true
                                : false,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              controller.filterIndex.value = 1;
                              controller.filterIndexName.value =
                                  "Letter wise : A -> Z";
                              Get.back();
                            },
                          ),
                          const CustomTextWidget(text: "Letter wise : A - Z"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStatePropertyAll(
                                controller.filterIndex.value == 4
                                    ? Colors.red
                                    : Colors.white),
                            value: controller.filterIndex.value == 4
                                ? true
                                : false,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              controller.filterIndex.value = 4;
                              controller.filterIndexName.value =
                                  "Letter wise : Z -> A";

                              Get.back();
                            },
                          ),
                          const CustomTextWidget(text: "Letter wise : Z -  A"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStatePropertyAll(
                                controller.filterIndex.value == 2
                                    ? Colors.red
                                    : Colors.white),
                            value: controller.filterIndex.value == 2
                                ? true
                                : false,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              controller.filterIndex.value = 2;
                              controller.filterIndexName.value =
                                  "Price wise : High -> Low";
                              Get.back();
                            },
                          ),
                          const CustomTextWidget(
                              text: "High Price > Low Price")
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStatePropertyAll(
                                controller.filterIndex.value == 3
                                    ? Colors.red
                                    : Colors.white),
                            value: controller.filterIndex.value == 3
                                ? true
                                : false,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              controller.filterIndex.value = 3;
                              controller.filterIndexName.value =
                                  "Price wise : Low -> High";
                              Get.back();
                            },
                          ),
                          const CustomTextWidget(
                              text: "Low Price > High Price")
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.filter_list_sharp,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
