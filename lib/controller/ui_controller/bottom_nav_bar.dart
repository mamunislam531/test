import 'dart:developer';

import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:alladin_e_store/view/screen/authentication/sign_in.dart';
import 'package:alladin_e_store/view/screen/category/category.dart';
import 'package:alladin_e_store/view/screen/home/home.dart';
import 'package:alladin_e_store/view/screen/profile/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  RxBool isAlreadyLogin = false.obs;
  RxInt page = 1.obs;

  List<Widget> screensList = [
    const Category(),
    const Home(),
    const Profile(),
  ];

  @override
  void onInit() {
    checkProfileUserAlreadyLogin();
    super.onInit();
  }

  checkProfileUserAlreadyLogin() async {
    var a = await LocalData().readData(key: "userInfo");
    log("Bottom USer Already Login : $a");
    if (a != "") {
      isAlreadyLogin.value = true;
      screensList = [
        const Category(),
        const Home(),
        const Profile(),
      ];
    } else {
      screensList = [
        const Category(),
        const Home(),
        const SignIn(),
      ];
    }
  }
}
