import 'package:alladin_e_store/controller/api_controller/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Create An Account Controller
class SignUpController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordEnable = true.obs;
  RxBool isConfirmPasswordEnable = true.obs;
  RxBool isLoading = false.obs;

  Future<bool> signUpService() async {
    bool status = await SignUpService.signUpService(
        email: emailController.text, phone: phoneController.text, password: passwordController.text, conPassword: confirmPasswordController.text);
    return status;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
