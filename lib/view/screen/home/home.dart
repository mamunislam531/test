import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/ui_controller/home.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_appbar.dart';
import 'package:alladin_e_store/view/common_widget/custom_banner_image.dart';
import 'package:alladin_e_store/view/common_widget/custom_product_card_image.dart';
import 'package:alladin_e_store/view/common_widget/custom_shimmer.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/all_product_list/all_shop_product.dart';
import 'package:alladin_e_store/view/screen/category/category.dart';
import 'package:alladin_e_store/view/screen/product_description/product_description.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widget/custom_refresh_button.dart';
import 'widget/category_product_card.dart';
import 'widget/home_drawer.dart';
import 'widget/trending_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      key: homeController.scaffoldKey,
      drawer: HomeDrawer(
        size: size,
      ),
      appBar: CustomAppBar(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  homeController.scaffoldKey.currentState?.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            buildSizedBox(width: 10),
            Expanded(
              flex: 8,
              child: InkWell(
                onTap: () {
                  Get.to(() => const AllShopProduct());
                },
                child: Card(
                  child: SizedBox(
                    height: 30,
                    width: size.width / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [CustomTextWidget(text: "search".tr, fontSize: 12), const Icon(Icons.search, size: 15)],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildSizedBox(width: 20),
            // const Expanded(flex: 1, child: Icon(Icons.mail, color: AppColors.bgLightColor)),
            //const Expanded(flex: 1, child: Icon(Icons.notifications, color: AppColors.bgLightColor)),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
//================================================================= Appbar  ==============
          Obx(
            () => SliverAppBar(
              leading: const SizedBox(),
              expandedHeight: size.height / 5.1,
              backgroundColor: AppColors.bg1LightColor,
              floating: true,
              automaticallyImplyLeading: true,
              snap: true,
              stretch: true,
              flexibleSpace: homeController.sliderLoading.isTrue
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Colors.white),
                          SizedBox(height: 10),
                          CustomTextWidget(
                            text: "Please Wait...",
                            fontColor: Colors.white,
                            fontSize: 20,
                          )
                        ],
                      ),
                    )
                  : homeController.sliderImageList.isEmpty
                      ? CustomRefreshButton(
                          height: size.height / 6.1,
                          iconColorColor: Colors.white,
                          refreshButton: () {
                            homeController.getMySliderData();
                          })
                      : CarouselSlider(
                          carouselController: homeController.carouselController,
                          items: homeController.sliderImageList
                              .map(
                                (e) =>
                                    // CustomBannerImage(networkImage: "${ApiBaseUrl.baseIP}${e.sliderImage}", height: size.height, width: size.width),
                                    CustomBannerImage(networkImage: e, height: size.height, width: size.width),
                              )
                              .toList(),
                          options: CarouselOptions(
                              aspectRatio: size.height / 500,
                              viewportFraction: 1,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration: Durations.short1),
                        ),
            ),
          ),

          //============================================= Heading =================================
          // SliverPadding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   sliver: SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //       childCount: 1,
          //       (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 10),
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               FeaturesCard(
          //                 onTap: () {
          //                   Get.to(const AllShopProduct());
          //                 },
          //                 imgUrl: 'assets/images/super_shop.png',
          //                 title: 'Super Shop',
          //               ),
          //               buildSizedBox(width: 10),
          //               FeaturesCard(
          //                 onTap: () {
          //                   // Get.to(const LaundryServiceForm());
          //                   Get.to(const AllShopProduct());
          //                 },
          //                 imgUrl: 'assets/images/laundry.png',
          //                 title: 'Laundry',
          //               ),
          //               buildSizedBox(width: 10),
          //               FeaturesCard(
          //                 onTap: () async {
          //                   Get.to(const AllShopProduct());
          //                   // var url = Uri.parse("https://alladin.com.bd/owner/product/medicine");
          //                   // if (!await launchUrl(url)) {
          //                   //   throw Exception('Could not launch $url');
          //                   // }
          //                 },
          //                 imgUrl: 'assets/images/mm.png',
          //                 title: 'Medicine',
          //               ),
          //             ],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),

//======================================================================   Category List   ==============
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            sliver: SliverList.list(children: [CustomTextWidget(text: "category".tr, fontSize: 18, fontWeight: FontWeight.w500)]),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  homeController.categoryScrollController.addListener(() {
                    if (homeController.categoryScrollController.offset >= homeController.categoryScrollController.position.maxScrollExtent &&
                        !homeController.categoryScrollController.position.outOfRange) {
                      log("reach the top");
                      Get.to(const Category(), arguments: index);
                    }
                  });
                  log("reach the top");
                  return Obx(
                    () => homeController.categoriesLoading.isTrue
                        ? SizedBox(
                            height: size.height / 6.5,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int i) {
                                return CustomShimmer(
                                  height: 80,
                                  width: 100,
                                  margin: 5,
                                  highlightColor: Colors.white,
                                  baseColor: Colors.grey.shade200,
                                  containerColor: Colors.white,
                                );
                              },
                            ),
                          )
                        : homeController.categories.isEmpty
                            ? CustomRefreshButton(
                                height: 100,
                                containerColor: Colors.grey.shade100,
                                iconColorColor: AppColors.bg1LightColor,
                                refreshButton: () {
                                  homeController.getCategoryData();
                                })
                            : SizedBox(
                                height: size.height / 6.5,
                                child: ListView.builder(
                                  controller: homeController.categoryScrollController,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.categories.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return CategoryProductCart(
                                        onTap: () {
                                          Get.to(
                                            () => const Category(),
                                            arguments: i,
                                            curve: Curves.easeIn,
                                            transition: Transition.fadeIn,
                                            duration: const Duration(milliseconds: 100),
                                          );
                                        },
                                        image: "${ApiBaseUrl.baseIP}${homeController.categories[i].categoryImage}",
                                        name: homeController.categories[i].categoryName?.en ?? "",
                                        height: 80,
                                        width: 80);
                                  },
                                ),
                              ),
                  );
                },
              ),
            ),
          ),

//=========================================================================   Trending Now  ==============
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            sliver: SliverList.list(children: [
              CustomTextWidget(
                text: "trending".tr,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )
            ]),
          ),
          TrendingView(homeController: homeController),

//=================================================================== Flash Sale Banner   ================
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            sliver: SliverList.list(children: [CustomTextWidget(text: "flash_sale".tr, fontSize: 18, fontWeight: FontWeight.w500)]),
          ),
          SliverAppBar(
            expandedHeight: size.height / 5.8,
            backgroundColor: AppColors.bgLightColor,
            floating: true,
            automaticallyImplyLeading: true,
            snap: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => homeController.flashSaleLoading.isTrue
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(color: AppColors.bg1LightColor),
                              SizedBox(height: 10),
                              CustomTextWidget(
                                text: "Please Wait...",
                                fontColor: AppColors.bg1LightColor,
                                fontSize: 20,
                              )
                            ],
                          ),
                        )
                      : homeController.flashSaleList.isEmpty
                          ? CustomRefreshButton(
                              height: size.height / 6.1,
                              containerColor: Colors.grey.shade100,
                              iconColorColor: AppColors.bg1LightColor,
                              refreshButton: () {
                                homeController.getFlashSaleData();
                              })
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CarouselSlider(
                                  carouselController: homeController.carouselController,
                                  items: homeController.flashSaleList
                                      .map(
                                        (e) => CustomBannerImage(networkImage: e, height: size.height, width: size.width),
                                      )
                                      .toList(),
                                  options: CarouselOptions(
                                      aspectRatio: size.height / 240,
                                      viewportFraction: 1,
                                      autoPlay: true,
                                      autoPlayInterval: const Duration(seconds: 2),
                                      autoPlayAnimationDuration: Durations.short1),
                                ),
                              ],
                            ),
                ),
              ),
            ),
          ),

//==========================================================================  Just for you   ========================
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            sliver: SliverList.list(children: [CustomTextWidget(text: "just_for_you".tr, fontSize: 18, fontWeight: FontWeight.w500)]),
          ),

          Obx(
            () => homeController.justForYouLoading.isTrue
                ? SliverGrid.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .62, crossAxisCount: 2),
                    itemCount: 2,
                    itemBuilder: (_, index) {
                      return CustomShimmer(
                        height: 80,
                        width: 100,
                        margin: 5,
                        highlightColor: Colors.white,
                        baseColor: Colors.grey.shade200,
                        containerColor: Colors.white,
                      );
                    })
                : homeController.justForYouProductList.isEmpty
                    ? SliverList.list(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomRefreshButton(
                              height: 270,
                              containerColor: Colors.grey.shade100,
                              refreshButton: () {
                                homeController.getJustForYouProducts();
                              }),
                        )
                      ])
                    : SliverGrid.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .62, crossAxisCount: 2),
                        itemCount: homeController.justForYouProductList.length,
                        itemBuilder: (_, index) {
                          return CustomProductCardImage(
                            productData: homeController.justForYouProductList[index],
                            onTap: () {
                              Get.to(ProductDescription(productData: homeController.justForYouProductList[index]),
                                  curve: Curves.easeIn,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(milliseconds: 500),
                                  arguments: homeController.justForYouProductList[index].productId.toString());
                            },
                            height: 200,
                            width: 100,
                          );
                        }),
          ),

          SliverPadding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            sliver: SliverList.list(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const AllShopProduct(),
                          curve: Curves.easeIn, transition: Transition.downToUp, duration: const Duration(milliseconds: 100));
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        decoration: BoxDecoration(color: AppColors.bg1LightColor, borderRadius: BorderRadius.circular(10)),
                        child: CustomTextWidget(text: "see_more".tr, fontSize: 18, fontColor: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                ],
              )
            ]),
          ),
        ],
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
