
import 'package:alladin_e_store/controller/ui_controller/bottom_nav_bar.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());
    return PopScope(
      canPop: false, //It should be false to work
      onPopInvoked: (didPop) {
        if (bottomNavBarController.page.value != 1) {
          bottomNavBarController.page.value = 1;
          return;
        }
        if (didPop) {
          return;
        }
        Get.defaultDialog(
          title: 'Confirmation',
          titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          content: const Text('Do you want to exit the app?'),
          actions: [
            GestureDetector(
              onTap: () => Navigator.pop(context, false),
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(color: AppColors.textLightColor, borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(color: AppColors.bg1LightColor, borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ],
        ); //Here this temporary, you can change this line
      },
      child: Scaffold(
        body: Obx(() => bottomNavBarController.screensList[bottomNavBarController.page.value]),
        bottomNavigationBar: Obx(
          () => CurvedNavigationBar(
            color: AppColors.bg1LightColor,
            height: 60,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 300),
            index: bottomNavBarController.page.value,
            key: bottomNavBarController.bottomNavigationKey,
            items: <Widget>[
              buildIcon(iconData: Icons.grid_view),
              buildIcon(iconData: Icons.home_outlined),
              buildIcon(iconData: Icons.account_circle_sharp),
            ],
            onTap: (index) {
              bottomNavBarController.page.value = index;
            },
          ),
        ),
      ),
    );
  }

  // Custom Icon
  Icon buildIcon({required IconData iconData}) {
    return Icon(iconData, size: 30, color: Colors.white);
  }
}
