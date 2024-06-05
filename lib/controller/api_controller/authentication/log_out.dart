
import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class LogOutService {
  static Future<bool> logOutService() async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.logOutUrl);
      var token = await LocalData().readData(key: "token");
      Map<String, String> headers = {"Content-type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer $token'};
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        await EasyLoading.showSuccess("Log Out Successful");
        return true;
      } else if (response.statusCode == 401) {
        debugPrint("Fail");
        await EasyLoading.showError("Already Log Out");
        return true;
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
