import 'package:alladin_e_store/controller/api_controller/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Login Controller
class SignInController extends GetxController {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordEnable = true.obs;
  RxBool isLoading = false.obs;

 Future<bool> signInService() async {
    bool a = await LoginService.loginService(email: emailController.text, password: passwordController.text);
     return a;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
