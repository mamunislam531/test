import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/ui_controller/category.dart';
import 'package:alladin_e_store/model/category_model.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/all_product_list/all_shop_product.dart';
import 'package:alladin_e_store/view/screen/home/widget/category_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/shimmer_loading_screen.dart';
import 'widgets/sub_category_heading.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: Text("category_list".tr)),
      body: Obx(
        () => categoryController.isLoading.value
            ? const ShimmerLoadingScreen()
            : categoryController.categories.isEmpty
                ? const Center(child: Text("No Data Found"))
                : Row(
                    children: [
                      // Category Section
                      Expanded(
                        flex: 2,
                        child: Obx(
                          () => Container(
                            color: Colors.grey.shade100,
                            margin: EdgeInsets.zero,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              itemCount: categoryController.categories.length,
                              itemBuilder: (_, index) {
                                return Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              categoryController.selectedCategoryIndex.value == index ? AppColors.bg1LightColor : Colors.transparent),
                                    ),
                                    child: CategoryProductCart(
                                        onTap: () {
                                          categoryController.selectedCategoryIndex.value = index;
                                          categoryController.selectedCategoryName.value = categoryController.categories[index].categoryName?.en ?? "";
                                        },
                                        image: "${ApiBaseUrl.baseIP}${categoryController.categories[index].categoryImage}",
                                        name: categoryController.categories[index].categoryName?.en ?? "",
                                        height: 80,
                                        width: 80),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      // Sub Category Section
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Obx(
                              () => SubCategoryHeading(text: categoryController.selectedCategoryName.value),
                            ),
                            Obx(
                              () => Expanded(
                                child: categoryController.categories[categoryController.selectedCategoryIndex.value].subCategoriesList?.isEmpty ??
                                        true
                                    ? const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomTextWidget(
                                            text: "No Data Found.!!",
                                          ),
                                        ],
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            categoryController.categories[categoryController.selectedCategoryIndex.value].subCategoriesList?.length ??
                                                0,
                                        itemBuilder: (_, listIndex) {
                                          SubCategoriesList? data = categoryController
                                              .categories[categoryController.selectedCategoryIndex.value].subCategoriesList?[listIndex];
                                          return Obx(
                                            () => ExpansionTile(
                                              key: GlobalKey(),
                                              initiallyExpanded: categoryController.isExpanded.value == listIndex,
                                              textColor: AppColors.bg1LightColor,
                                              iconColor: AppColors.bg1LightColor,
                                              onExpansionChanged: (value) {
                                                categoryController.isExpanded.value = listIndex;
                                              },
                                              title: CustomTextWidget(
                                                text: data?.subCategories?.en ?? "",
                                                maxLine: 2,
                                              ),
                                              clipBehavior: Clip.none,
                                              backgroundColor: Colors.grey.shade200,
                                              shape: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                              children: [
                                                data?.childCategoriesList!.isEmpty ?? true
                                                    ? const Padding(
                                                        padding: EdgeInsets.only(top: 100, bottom: 20),
                                                        child: CustomTextWidget(
                                                          text: "No Data Found.!!",
                                                        ),
                                                      )
                                                    : GridView.builder(
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                                                        itemCount: data?.childCategoriesList?.length ?? 0,
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: .67),
                                                        itemBuilder: (_, gridIndex) {
                                                          return CategoryProductCart(
                                                            onTap: () {
                                                              _categoryWiseProductFunction(
                                                                  childCategoryID: data!.childCategoriesList?[gridIndex].childCategoryId
                                                                          ?.toString()
                                                                          .toLowerCase() ??
                                                                      "",
                                                                  childCategoryName:
                                                                      data.childCategoriesList?[gridIndex].childCategoryName?.en.toString() ??
                                                                          "Shop Products");
                                                            },
                                                            image: "${ApiBaseUrl.baseIP}${data?.childCategoriesList?[gridIndex].image}",
                                                            name: data?.childCategoriesList?[gridIndex].childCategoryName?.en ?? "",
                                                            height: size.height / 10,
                                                            width: 200,
                                                          );
                                                        },
                                                      ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
      ),
    );
  }

  _categoryWiseProductFunction({required String childCategoryID, required String childCategoryName}) {
    log("object :$childCategoryID");
    Get.to(
      () => const AllShopProduct(),
      arguments: {"id": childCategoryID, "name": childCategoryName},
    );
  }
}
