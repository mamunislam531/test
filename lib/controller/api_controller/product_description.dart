import 'dart:convert';

import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/model/product_description_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class ProductDescriptionService {
  static Future<ProductDescriptionModel?> productDescriptionService({required String id}) async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.productDescriptionUrl+id);
      Map<String, String> headers = {"Content-type": "application/json", "Accept": "application/json"};
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        ProductDescriptionModel descriptionModel = ProductDescriptionModel.fromJson(jsonDecode(response.body));
        return descriptionModel;
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return null;
  }
}
