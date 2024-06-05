import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/category_wise_product.dart';
import 'package:alladin_e_store/model/all_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWiseShopProductController extends GetxController {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController minimumPriceController = TextEditingController();
  final TextEditingController maximumPriceController = TextEditingController();
  RxString filterIndexName = "Default".obs;
  RxBool searchClosed = true.obs;
  RxBool isLoading = true.obs;
  RxInt filterIndex = 0.obs;
  RxString childCategoryName = "Product Shop".obs;
  RxList<Products> productList = <Products>[].obs;
  RxInt tapCount = 0.obs;
  RxList<String> categoryList = <String>[].obs;
  RxList<String> brandList = <String>[].obs;
  RxString categoryName = "".obs;
  RxString brandName = "".obs;
  RxString ratingFilterIndex = "".obs;

  @override
  void onInit() {
    getProductList();
    getCategoryList();
    super.onInit();
  }

  getCategoryList() async {
    List<String> data = ["All", "Electronics", "Clothing", "Grocery", "Health & Beauty"];
    categoryList.value = data;
    categoryName.value = categoryList.first;
  }

  getBrandList() async {
    List<String> data = [
      "All",
      "Oppo",
      "Techno",
      "Xaomi",
      "Nokia",
      "One Plus",
      "I-Phone 12",
      "I-Phone 13",
      "I-Phone 14",
      "I-Phone 15",
      "I-Phone 12",
      "I-Phone 13",
      "I-Phone 14",
      "I-Phone 15"
    ];
    brandList.value = data;
    brandName.value = brandList.first;
  }

  getProductList() async {
    Map<String, String> data = await Get.arguments ?? {};
    String id = "0";

    if (data.isNotEmpty) {
      childCategoryName.value = data['name'] ?? "";
      id = data['id'] ?? "0";
    }
    isLoading.value = true;
    if (id != "0") {
      var a = await CategoryWiseProductListService.categoryWiseProductListService(id: id);
      productList.clear();
      productList.value = a;
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
