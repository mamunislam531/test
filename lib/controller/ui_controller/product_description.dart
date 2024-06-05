import 'dart:developer';
import 'package:alladin_e_store/controller/api_controller/product_description.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class DescriptionController extends GetxController {
  CarouselController carouselController = CarouselController();
  RxInt selectedImgIndex = 0.obs;
  RxInt productQty = 1.obs;
  var detailsData = {}.obs;
  RxList<String> imageList = <String>[].obs;
  String id = "0";
  RxDouble productAmount = 0.00.obs;

  @override
  void onInit() {
    getProductDescription();
    super.onInit();
  }

  getProductDescription() async {
    id = await Get.arguments ?? "0";
    var a = await ProductDescriptionService.productDescriptionService(id: id);
    log("---ProductDescriptionService  : ${a?.productDetails?.images?.length}");
    if (a?.productDetails != null) {
      for (var i in a?.productDetails?.images ?? []) {
        imageList.add(i.toString());
      }

      var data = {
        "rating": a?.productDetails?.rating ?? "",
        "review": a?.productDetails?.review ?? "",
        "description": a?.productDetails?.description?.en ?? "",
      };
      detailsData.addAll(data);
    }

    log("LLLLLLLL  : $detailsData");
  }

  // addToCartProduct({required int productID, required int qty}) async {
  //   bool status = await AddToCartProductService.addToCartProductService(id: productID, qty: qty);
  //   if (status) {
  //     Get.back();
  //     await EasyLoading.dismiss();
  //   }
  // }
}
