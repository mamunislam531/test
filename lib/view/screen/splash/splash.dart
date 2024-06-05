import 'dart:developer';

import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:alladin_e_store/view/screen/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool alreadyLogin = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _alreadyLogin();
    logoAnimationController();
  }

  _alreadyLogin() async {
    var a = await LocalData().readData(key: "userInfo");
    if (a != "") {
      alreadyLogin = true;
    } else {
      alreadyLogin = false;
    }
  }

  logoAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0.01, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
        reverseCurve: Curves.easeInBack,
      ),
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        log("----------- Splash - Already Login : $alreadyLogin");
        alreadyLogin ? Get.offAll(() => const BottomNavBarScreen()) : Get.offAll(() => const WelcomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.bg1LightColor,
        child: ScaleTransition(
          filterQuality: FilterQuality.medium,
          scale: _animation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/splash_logo.png',
                  height: 350,
                  width: 300,
                ),
                Text(
                  "Let's get start..".tr,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
