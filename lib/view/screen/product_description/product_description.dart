import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:alladin_e_store/controller/ui_controller/product_description.dart';
import 'package:alladin_e_store/model/all_product_list.dart';
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_rating.dart';
import 'package:alladin_e_store/view/common_widget/custom_rich_text.dart';
import 'package:alladin_e_store/view/common_widget/custom_shimmer.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/authentication/sign_in.dart';
import 'package:alladin_e_store/view/screen/favorite/widget/discount_price_text.dart';
import 'package:alladin_e_store/view/screen/shipping_&_checkout/shipping/shipping.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/expansion_tile.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.productData});

  final Products productData;

  @override
  Widget build(BuildContext context) {
    DescriptionController descriptionController = Get.put(DescriptionController());
    Size size = MediaQuery.sizeOf(context);
    log("${descriptionController.imageList.runtimeType}");
    List<String>? imageList = descriptionController.imageList;
    descriptionController.productAmount.value = double.parse(productData.regPrice.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("description".tr),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: InkWell(child: Icon(Icons.share)),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => descriptionController.imageList.isEmpty
                  ? CustomShimmer(
                      height: 185,
                      margin: 5,
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade200,
                      containerColor: Colors.white,
                    )
                  : CarouselSlider(
                      carouselController: descriptionController.carouselController,
                      items: imageList
                          .map(
                            (e) => Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage("${ApiBaseUrl.baseIP}$e"),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        aspectRatio: size.height / 400,
                        viewportFraction: 1,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: Durations.short1,
                      ),
                    ),
            ),
            buildSizedBox(height: 10),
            Center(
              child: Obx(
                () => descriptionController.imageList.isEmpty
                    ? CustomShimmer(
                        height: 80,
                        margin: 1,
                        highlightColor: Colors.white,
                        baseColor: Colors.grey.shade200,
                        containerColor: Colors.white,
                      )
                    : SizedBox(
                        height: 80,
                        width: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: descriptionController.imageList.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () {
                                  descriptionController.selectedImgIndex.value = index;
                                  descriptionController.carouselController.animateToPage(index);
                                },
                                child: Obx(
                                  () => Container(
                                    margin: buildEdgeInsets(h: 5, v: 5),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: descriptionController.selectedImgIndex.value == index
                                          ? Border.all(color: AppColors.bg1LightColor, width: 4, strokeAlign: BorderSide.strokeAlignOutside)
                                          : Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffFFEDE5),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("${ApiBaseUrl.baseIP}${descriptionController.imageList[index]}"),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
              ),
            ),
            buildSizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: productData.nameEn.toString(),
                    maxLine: 10,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    children: [
                      CustomRating(ratingStar: int.parse(productData.rating.toString())),
                      buildSizedBox(weight: 20),
                      CustomTextWidget(
                        text: "( ${productData.rating} Review )",
                        maxLine: 10,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      const Spacer(),
                      CustomRichText(
                        titleText: "Stock :  ",
                        bodyText: productData.stock.toString(),
                        titleStyle: const TextStyle(color: AppColors.bg1LightColor),
                      )
                    ],
                  ),
                  buildSizedBox(height: 5),
                  DiscountPrice(
                      regularPriceFontSize: 15,
                      salePriceFontSize: 20,
                      regularPrice: double.parse(productData.regPrice.toString()),
                      discountPrice: double.parse(productData.disPrice.toString()),
                      discountType: productData.disType.toString()),
                  buildSizedBox(height: 10),
                  Row(
                    children: [
                      const CustomTextWidget(
                        text: "Total Price: ",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      buildSizedBox(weight: 10),
                      Obx(
                        () => CustomTextWidget(
                          text: "${descriptionController.productAmount.value} ৳",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  buildSizedBox(height: 5),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (descriptionController.productQty.value > 1) {
                            descriptionController.productQty.value--;
                            descriptionController.productAmount.value =
                                double.parse(descriptionController.productQty.value.toString()) * double.parse(productData.regPrice.toString());
                          }
                        },
                        child: Card(
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                          child: Padding(
                            padding: buildEdgeInsets(h: 10, v: 5),
                            child: const Icon(Icons.remove),
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100,
                          ),
                          padding: buildEdgeInsets(h: 10, v: 6),
                          margin: buildEdgeInsets(h: 5, v: 6),
                          child: Text(descriptionController.productQty.value.toString()),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          descriptionController.productQty.value++;
                          descriptionController.productAmount.value =
                              double.parse(descriptionController.productQty.value.toString()) * double.parse(productData.regPrice.toString());
                        },
                        child: Card(
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                          child: Padding(
                            padding: buildEdgeInsets(h: 10, v: 5),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                  buildSizedBox(height: 10),
                  Obx(
                    () => CustomExpansionTile(description: descriptionController.detailsData['description'] ?? "", title: 'product_description'.tr),
                  ),
                  // buildSizedBox(height: 2),
                  // CustomExpansionTile(description: '', title: 'product_specification'.tr),
                  // buildSizedBox(height: 20),
                  // CustomTextWidget(
                  //   text: "related_product".tr,
                  //   fontWeight: FontWeight.w500,
                  //   fontSize: 20,
                  // ),
                  // GridView.builder(
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: dbController.electronics.length,
                  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .7),
                  //     itemBuilder: (context, index) {
                  //       return RelatedProducts(data: dbController.electronics[index]);
                  //     })
                ],
              ),
            ),
          ],
        ),
      ),

      /// Add to cart and Buy Now Button
      bottomNavigationBar: productData.stock == "0"
          ? const SizedBox()
          : SizedBox(
              height: 60,
              child: Row(
                children: [
                  // const Expanded(child: SizedBox()),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        var a = await LocalData().readData(key: "userInfo");
                        if (a == "") {
                          Get.to(() => const SignIn());
                        } else {
                          Get.to(
                            const Shipping(),
                            arguments: {
                              "price": "${descriptionController.productAmount}",
                              "product_id": "${productData.productId}",
                              "quantity": "${descriptionController.productQty}",
                              "delivery_charge": "49.00",
                              "payable_amount": "${descriptionController.productAmount + 49.00}"
                            },
                            popGesture: true,
                            opaque: false,
                            fullscreenDialog: false,
                            preventDuplicates: false,
                            curve: Curves.easeIn,
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 600),
                          );
                        }
                      },
                      child: Card(
                        color: AppColors.bg1LightColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Center(
                            child: CustomTextWidget(
                              text: "buy_now".tr,
                              fontColor: AppColors.primaryLightColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Custom Padding  EdgeInsets with symmetric
  EdgeInsets buildEdgeInsets({double? h, double? v}) => EdgeInsets.symmetric(horizontal: h ?? 0, vertical: v ?? 0);

  // Custom SizedBox
  SizedBox buildSizedBox({double? height, double? weight}) {
    return SizedBox(
      width: weight ?? 0,
      height: height ?? 0,
    );
  }
}
