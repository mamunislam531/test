import 'dart:convert';
import 'dart:io';

import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class ProfileUpdateService {
  static Future<bool> profileUpdateService({required String name, required String address, required File image}) async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.profileUpdateUrl);
      var token = await LocalData().readData(key: "token");
      var request = http.MultipartRequest('POST', url);
      request.fields['name'] = name;
      request.fields['address'] = address;
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';
      if (image.path != "") {
        request.files.add(
          http.MultipartFile.fromBytes("image", File(image.path).readAsBytesSync(), filename: image.path),
        );
      }

      var response = await request.send();
      var bodyResponse = await http.Response.fromStream(response);
      var responseData = jsonDecode(bodyResponse.body);

      if (response.statusCode == 200) {
        var data = jsonEncode(responseData['response_data']);
        await LocalData().writeData(key: "userInfo", value: data);
        await EasyLoading.showSuccess("Profile Updated Successfully");
        return true;
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
