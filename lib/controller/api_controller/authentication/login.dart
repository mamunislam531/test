import 'dart:convert';
import 'dart:developer';
import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<bool> loginService({required String email, required String password}) async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.signInUrl);
      var body = {"email_phone": email, "password": password};
      Map<String, String> headers = {"Content-type": "application/json", "Accept": "application/json"};
      var response = await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        var data = jsonEncode(jsonDecode(response.body)['response_data']);
        var token = jsonDecode(response.body)['token'];
        await LocalData().writeData(key: "userInfo", value: data);
        await LocalData().writeData(key: "token", value: token);
        log("------ Login Service - Login Data Stored : $data");
        log("------ Login Token - Token Data Stored : $token");
        await EasyLoading.showSuccess("Login Successful");
        return true;
      } else if (response.statusCode == 401) {
        debugPrint("Fail");
        await EasyLoading.showError("Wrong User");
        return false;
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
