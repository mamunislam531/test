import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController {
  final shippingFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  Map<String, dynamic> argumentsData = {};

  @override
  void onInit() {
    getArgumentsData();
    super.onInit();
  }

  getArgumentsData() async {
    argumentsData = await Get.arguments ?? {};
    log("message  : $argumentsData");
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Map<String, String> shippingInfoData() {
    var data = {
      "customer_name": nameController.text,
      "customer_email": mailController.text,
      "customer_phone": phoneController.text,
      "street": houseController.text,
      "city": cityController.text,
      "zip_code": postalCodeController.text,
      "district": districtController.text,
      "division": divisionController.text,
      "product_id": argumentsData['product_id'].toString(),
      "quantity": argumentsData['quantity'].toString(),
      "price": argumentsData['price'].toString(),
      "delivery_charge": argumentsData['delivery_charge'].toString(),
      "total_amount" : argumentsData['payable_amount'].toString()
    };
    return data;
  }

  var aaaa = {
    "trx_id": "ASD123654",
    "customer_name": "Safim",
    "customer_email": "safim@gmail.com",
    "customer_phone": "016240254785",
    "street": "Road 7, sector 4",
    "city": "Uttara",
    "zip_code": 1230,
    "district": "Dhaka",
    "division": "Dhaka",
    "product_id": 1,
    "quantity": 3,
    "price": 300,
    "delivery_charge": 80,
    "payment_method": "bkash",
  };
}
