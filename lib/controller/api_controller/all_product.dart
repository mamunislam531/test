import 'dart:convert';
import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/model/all_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class AllProductListService {
  static Future<List<Products>> allProductListService() async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.allProductListUrl);
      Map<String, String> headers = {"Content-type": "application/json", "Accept": "application/json"};
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        AllProductListModel productList = AllProductListModel.fromJson(jsonDecode(response.body));
        return productList.products ?? [];
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return [];
  }
}
