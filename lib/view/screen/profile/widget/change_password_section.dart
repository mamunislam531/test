
import 'package:alladin_e_store/controller/ui_controller/profile.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/utils/common_function/common_snackbar_message.dart';
import 'package:alladin_e_store/utils/common_function/internet_connection_checker.dart';
import 'package:alladin_e_store/view/common_widget/custom_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_loading_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/profile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordSection extends StatelessWidget {
  const ChangePasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, right: 10, left: 10, top: 20),
      child: SingleChildScrollView(
        child: Form(
          key: profileController.formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.vpn_key,
                    color: AppColors.bg1LightColor,
                  ),
                  const SizedBox(width: 10),
                  CustomTextWidget(
                    text: "change_password".tr,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.bg1LightColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: profileController.oldPasswordController,
                labelText: 'current_password'.tr,
              ),
              CustomTextField(
                controller: profileController.newPasswordController,
                labelText: 'new_password'.tr,
              ),
              CustomTextField(
                controller: profileController.confPasswordController,
                labelText: 'confirm_password'.tr,
              ),
              const SizedBox(height: 10),
              Obx(
                () => profileController.isLoading.value
                    ? const CustomLoadingButton(buttonWidth: 150)
                    : CustomButton(
                        text: "edit".tr,
                        buttonWidth: 150,
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          if(!profileController.formKey.currentState!.validate()){
                            return ;
                          }
                          if (!await ConnectionChecker.checkConnection()) {
                            CommonSnackBarMessage.noInternetConnection();
                            return;
                          }
                          bool status = await profileController.changePasswordService();
                          if (status) {
                            profileController.confPasswordController.clear();
                            profileController.newPasswordController.clear();
                            profileController.oldPasswordController.clear();
                            Get.back();
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
