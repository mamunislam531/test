import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/all_product.dart';
import 'package:alladin_e_store/controller/api_controller/category.dart';
import 'package:alladin_e_store/controller/api_controller/slider_image_list.dart';
import 'package:alladin_e_store/model/all_product_list.dart';
import 'package:alladin_e_store/model/category_model.dart';
import 'package:alladin_e_store/model/sliderImageList.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CarouselController carouselController = CarouselController();
  ScrollController categoryScrollController = ScrollController();
  ScrollController trendingScrollController = ScrollController();
  ScrollController justForYouScrollController = ScrollController();
  RxList<Products> justForYouProductList = <Products>[].obs;
  RxList<Products> trendingProductList = <Products>[].obs;
  RxList<Categories> categories = <Categories>[].obs;
  RxList<MySlider> mySliderList = <MySlider>[].obs;
  RxList<MySlider> flashSaleImageList = <MySlider>[].obs;
  List<String> flashSaleList = [
    "https://youthopia.in/wp-content/uploads/2019/10/shopaholic-1.jpg",
    "https://thumbs.dreamstime.com/z/flash-sale-banner-template-design-abstract-promotional-vector-illustration-189170139.jpg",
    "https://static.vecteezy.com/system/resources/previews/003/692/287/non_2x/big-sale-discount-promotion-banner-template-with-blank-product-podium-scene-graphic-free-vector.jpg",
    "https://i.graphicmama.com/blog/wp-content/uploads/2019/11/08101220/tropical-summer-sale-banner.jpg",
    "https://3c5239fcccdc41677a03-1135555c8dfc8b32dc5b4bc9765d8ae5.ssl.cf1.rackcdn.com/22-12-28-BANS-sale-banner-1025x325-riot.jpg"
  ];
  RxBool sliderLoading = false.obs;
  RxBool flashSaleLoading = false.obs;
  RxBool categoriesLoading = false.obs;
  RxBool trendingViewLoading = false.obs;
  RxBool justForYouLoading = false.obs;

  List<String> sliderImageList = [
    "https://www.distacart.com/cdn/shop/articles/blog_1.jpg?v=1629464856",
    "https://kotthasfoods.com/assets-new/brand-banner-v2-1.jpg",
    "https://i.pinimg.com/originals/42/f7/ac/42f7ac824803b0fc85bc37d8b2ac6481.jpg",
    "https://marketplace.canva.com/EAFWt8Wq208/1/0/1600w/canva-grey-minimalist-special-offer-banner-landscape-tVz4E4KVLgk.jpg",
    "https://img.freepik.com/free-psd/fashion-model-banner-template_23-2148858371.jpg"
  ];

  @override
  void onInit() {
    getMySliderData();
    getFlashSaleData();
    getJustForYouProducts();
    getTrendingProducts();
    getCategoryData();
    super.onInit();
  }

  getJustForYouProducts() async {
    justForYouLoading.value = true;
    var a = await AllProductListService.allProductListService();
    justForYouProductList.clear();
    justForYouProductList.value = a;
    justForYouLoading.value = false;
    log("justForYouProductList : ${justForYouProductList.length}");
  }

  getTrendingProducts() async {
    trendingViewLoading.value = true;
    var a = await AllProductListService.allProductListService();
    trendingProductList.clear();
    trendingProductList.value = a;
    trendingViewLoading.value = false;
    log("Trending : ${trendingProductList.length}");
  }

  getCategoryData() async {
    categoriesLoading.value = true;
    var a = await CategoryService.categoryService();
    categories.clear();
    categories.value = a?.categories ?? [];
    categoriesLoading.value = false;
    log("Categories List : ${categories.length}");
  }

  getMySliderData() async {
    sliderLoading.value = true;
    var data = await SliderImageListService.sliderImageListService();
    mySliderList.clear();
    mySliderList.value = data;
    sliderLoading.value = false;
    log("My-Slider List : ${mySliderList.length}");
  }

  getFlashSaleData() async {
    flashSaleLoading.value = true;
    var data = await SliderImageListService.sliderImageListService();
    flashSaleImageList.clear();
    flashSaleImageList.value = data;
    flashSaleLoading.value = false;
    log("Flash Sale List : ${mySliderList.length}");
  }
}
