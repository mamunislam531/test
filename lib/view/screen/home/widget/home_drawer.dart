
import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/ui_controller/bottom_nav_bar.dart';
import 'package:alladin_e_store/controller/ui_controller/profile.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
              width: size.width,
              decoration: const BoxDecoration(
                  color: AppColors.bg1LightColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => SizedBox(
                          height: 70,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipOval(
                              child: FadeInImage.assetNetwork(
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                placeholder: "assets/images/splash_logo.png",
                                image: "${ApiBaseUrl.baseIP}${profileController.userInfo['Profile_image'] ?? ""}",
                                imageErrorBuilder: (context, o, t) {
                                  return const CircleAvatar(
                                    backgroundImage: NetworkImage("https://i.pinimg.com/736x/0c/6f/39/0c6f39dac4d7f30139a7d61ee28a2ef5.jpg"),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomTextWidget(
                        text: "${profileController.userInfo['name'] ?? "Empty Name"}",
                        fontColor: Colors.white,
                        fontSize: 17,
                      ),
                      CustomTextWidget(
                        text: "${profileController.userInfo['email'] ?? "Empty Email"}",
                        fontColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                const SizedBox(height: 5),
                DrawerListTile(
                  onTap: () {
                    Get.back();
                  },
                  icon: Icons.home,
                  title: 'Home',
                ),
                DrawerListTile(
                  onTap: () {
                    Get.back();
                    BottomNavBarController controller = Get.put(BottomNavBarController());
                    controller.page.value = 2;
                  },
                  icon: Icons.account_circle,
                  title: 'Profile',
                ),
                // DrawerListTile(
                //   onTap: () {
                //     Get.to(() => const MyOrders());
                //   },
                //   icon: Icons.shop,
                //   title: 'My Orders',
                // ),
                // DrawerListTile(
                //   onTap: () {
                //     Get.to(() => const CustomOrder());
                //   },
                //   icon: Icons.card_travel_outlined,
                //   title: 'Custom Order',
                // ),
                // DrawerListTile(
                //   onTap: () {
                //     Get.to(() => const LaundryServiceForm());
                //   },
                //   icon: Icons.local_laundry_service,
                //   title: 'Laundry Service',
                // ),
                // DrawerListTile(
                //   onTap: () {
                //     Get.to(() => const AboutUsScreen());
                //   },
                //   icon: Icons.branding_watermark,
                //   title: 'About Us',
                // ),
              ],
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 5),
          //     //color: Colors.red,
          //     child: Row(
          //       children: [
          //         const CustomTextWidget(
          //           text: "Developed by : ",
          //           fontSize: 12,
          //           fontColor: AppColors.bg1LightColor,
          //         ),
          //         const SizedBox(width: 10),
          //         Expanded(
          //             child: InkWell(
          //           onTap: () async {
          //             var url = Uri.parse("https://classicit.com.bd/");
          //             if (!await launchUrl(url)) {
          //               throw Exception('Could not launch $url');
          //             }
          //           },
          //           child: const CustomTextWidget(
          //             text: "Classic It & Sky Mart",
          //             fontColor: AppColors.bg1LightColor,
          //           ),
          //         )),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Icon(
                icon,
                color: AppColors.bg1LightColor,
              ),
            ),
            Expanded(
              flex: 8,
              child: CustomTextWidget(text: title),
            ),
          ],
        ),
      ),
    );
  }
}
