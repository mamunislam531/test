import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/all_product.dart';
import 'package:alladin_e_store/controller/api_controller/category_wise_product.dart';
import 'package:alladin_e_store/model/all_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllShopProductController extends GetxController {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final TextEditingController searchController = TextEditingController();
  RxString filterIndexName = "Default".obs;
  RxBool searchClosed = true.obs;
  RxBool isLoading = true.obs;
  RxInt filterIndex = 0.obs;
  RxString childCategoryName = "Product Shop".obs;
  RxList<Products> productList = <Products>[].obs;
  RxInt tapCount = 0.obs;

  @override
  void onInit() {
    getProductList();
    super.onInit();
  }

  getProductList() async {
    Map<String, String> data = await Get.arguments ?? {};
    isLoading.value = true;
    log("-------ShopProductController- arguments  :  $data");
    if (data.isEmpty) {
      var myData = await AllProductListService.allProductListService();
      productList.clear();
      productList.value = myData;
    } else {
      var myData = await CategoryWiseProductListService.categoryWiseProductListService(id: data['id'].toString());
      productList.value = myData;
    }
    isLoading.value = false;
    log("--------- ShopProductController productList :  ${productList.length}");
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
