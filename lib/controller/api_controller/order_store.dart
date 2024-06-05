import 'dart:convert';
import 'dart:developer';
 import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class OrderStoreService {
  static Future<bool> orderStoreService({required Map data, required String trxID, required String payMode}) async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.orderStoreUrl);
      log(jsonEncode(data));
      log("+++++++++++++++++++++  $trxID   $payMode");
      var body = {
        "customer_name": "${data['customer_name']}",
        "customer_email": "${data['customer_email']}",
        "customer_phone": "${data['customer_phone']}",
        "street": "${data['street']}",
        "city": "${data['city']}",
        "zip_code": int.parse("${data['zip_code'] ?? 0}"),
        "district": "${data['district']}",
        "division": "${data['division']}",
        "product_id": int.parse("${data['product_id'] ?? 0}"),
        "quantity": double.parse("${data['quantity'] ?? 0}"),
        "price": double.parse("${data['price'] ?? 0}"),
        "delivery_charge": double.parse("${data['delivery_charge'] ?? 0}"),
        "trx_id": trxID,
        "payment_method": payMode
      };
      log("------------ REs : $body");
      Map<String, String> headers = {"Content-type": "application/json", "Accept": "application/json"};
      var response = await http.post(url, body: jsonEncode(body), headers: headers);
      log("------------ REs : ${response.statusCode}");
      if (response.statusCode == 200) {
        log("--------safaewfcfe : ${response.statusCode}");
        await EasyLoading.showSuccess("Order Successful");
        return true;
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
