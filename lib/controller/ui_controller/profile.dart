import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:alladin_e_store/controller/api_controller/authentication/change_password.dart';
import 'package:alladin_e_store/controller/api_controller/profile_update.dart';
import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:alladin_e_store/utils/app_data.dart';
import 'package:alladin_e_store/utils/common_function/common_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  RxInt selectedTab = 0.obs;
  RxInt selectedOrderTab = 1.obs;
  RxBool languageEN = true.obs;
  RxBool themeLight = true.obs;
  RxBool isLoading = false.obs;
  RxMap<dynamic, dynamic> userInfo = {}.obs;
  ImageSource imageSource = ImageSource.camera;
  late Rx<File?> profileIMG = Rx<File?>(null);
  final picker = ImagePicker();

  @override
  void onInit() {
    AppData.appLanguage == "EN" ? languageEN.value = true : languageEN.value = false;
    getProfileInfo();
    super.onInit();
  }

  getProfileInfo() async {
    var a = await LocalData().readData(key: "userInfo");
    log("---Profile - User Info : $a");
    if (a != "") {
      userInfo.value = jsonDecode(a);
      nameController.text = userInfo['name'] ?? "";
      addressController.text = userInfo['address'] ?? "";
    }
  }

  getImage({required ImageSource imageSource}) async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: imageSource, imageQuality: 25);
      if (pickedFile != null) {
        profileIMG.value = File(pickedFile.path);
      }
    } else {
      CommonSnackBarMessage.errorMessage(text: "Gallery or Camera Permission are Denied");
    }

  }

  Future<bool> changePasswordService() async {
    isLoading.value = true;
    bool status = await ChangePasswordService.changePasswordService(
        currentPass: oldPasswordController.text, newPassword: newPasswordController.text, confPassword: confPasswordController.text);
    isLoading.value = false;
    return status;
  }

  Future<bool> accountDeleteService() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
   // bool status = await ChangePasswordService.changePasswordService(
    //    currentPass: oldPasswordController.text, newPassword: newPasswordController.text, confPassword: confPasswordController.text);
    isLoading.value = false;
    //return status;
    return true;
  }

  Future<bool> profileUpdateService() async {
    isLoading.value = true;
    bool status = await ProfileUpdateService.profileUpdateService(
        name: nameController.text, address: addressController.text, image: File(profileIMG.value?.path ?? ""));
    isLoading.value = false;
    return status;
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confPasswordController.dispose();
    super.dispose();
  }
}
