import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/ui_controller/profile.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/common_widget/image_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/profile_edit_section.dart';
import 'widget/profile_section.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    profileController.getProfileInfo();
    Size size = MediaQuery.sizeOf(context);
    log("${ApiBaseUrl.baseIP}${profileController.userInfo['Profile_image'] ?? ""}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: size.width,
                    padding: const EdgeInsets.only(top: 70, bottom: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.bg1LightColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => ImageViewWidget(
                                imgUrl: "${ApiBaseUrl.baseIP}${profileController.userInfo['Profile_image'] ?? ""}",
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 100,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ClipOval(
                                child: Obx(
                                  () => FadeInImage.assetNetwork(
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
                        ),
                        const SizedBox(height: 10),
                        CustomTextWidget(
                            text: "${profileController.userInfo['name'] ?? "Please update your name"}",
                            fontColor: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        CustomTextWidget(
                            text: "${profileController.userInfo['email'] ?? "Empty E-mail"}",
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(text: "phone".tr, fontColor: Colors.white, fontWeight: FontWeight.w300, fontSize: 13),
                            CustomTextWidget(
                                text: " : ${profileController.userInfo['phone']}",
                                fontColor: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 13),
                          ],
                        ),
                        CustomTextWidget(
                            text: "${profileController.userInfo['address'] ?? "Empty E-mail"}",
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (builder) {
                              return const ProfileEditSection();
                            });
                      },
                      icon: const Icon(
                        Icons.edit_note_sharp,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // buildSizedBox(height: 25),
            const ProfileSection()
          ],
        ),
      ),
    );
  }

  // Common Sized Box
  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
