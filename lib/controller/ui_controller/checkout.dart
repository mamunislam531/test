import 'dart:developer';
 import 'package:alladin_e_store/controller/api_controller/order_store.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  RxMap<String, String> data = <String, String>{}.obs;
  RxDouble payableAmount = 0.0.obs;
  RxString selectMethode = "".obs;
  @override
  void onInit() {
    getArgumentsData();
    super.onInit();
  }

  getArgumentsData() async {
    data.value = await Get.arguments ?? {};
    log(" =========  $data");
    payableAmount.value = double.parse(data['total_amount'] ?? "0");
  }


 Future<bool> orderStoreService({String? tranID})async{
    bool status = await OrderStoreService.orderStoreService(data: data, trxID: tranID ?? '', payMode: selectMethode.value);
    return status;
  }
}
