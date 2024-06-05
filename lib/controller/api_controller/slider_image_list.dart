import 'dart:convert';

import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/model/sliderImageList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class SliderImageListService {
  static Future<List<MySlider>> sliderImageListService() async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.sliderImageUrl);
      Map<String, String> headers = {"Content-type": "application/json", "Accept": "application/json"};
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        SliderImageListModel sliderList = SliderImageListModel.fromJson(jsonDecode(response.body));
        return sliderList.mySlider ?? [];
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Slider : Something went wrong..!!");
    return [];
  }
}
