  import 'package:alladin_e_store/controller/api_controller/category.dart';
import 'package:alladin_e_store/model/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxInt selectedCategoryIndex = 0.obs;
  RxString selectedCategoryName = "".obs;
  RxList<Categories> categories = <Categories>[].obs;
  RxBool isLoading = true.obs;
  RxInt isExpanded = 100.obs;

  @override
  void onInit() {
    getArgumentsData();
    getCategoryData();
    super.onInit();
  }

  getCategoryData() async {
    isLoading.value = true;
    var a = await CategoryService.categoryService();
    categories.value = a?.categories ?? [];
    if (categories.isNotEmpty) {
      selectedCategoryName.value = categories[selectedCategoryIndex.value].categoryName?.en.toString() ?? "";
      isExpanded.value = 0;
    }
    isLoading.value = false;
  }

  getArgumentsData() async {
    selectedCategoryIndex.value = await Get.arguments ?? 0;
  }
}
