import 'dart:convert';
import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:alladin_e_store/utils/common_function/common_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class ChangePasswordService {
  static Future<bool> changePasswordService({required String currentPass, required String newPassword, required String confPassword}) async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.changePasswordUrl);
      var token = await LocalData().readData(key: "token");
      Map<String, String> headers = {"Content-type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer $token'};
      var body = {"current_password": currentPass, "new_password": newPassword, "confirm_password": confPassword};
      var response = await http.post(url, body: jsonEncode(body), headers: headers);
      log("------ Change Password Service -  : ${response.body}");
      log("------ Change Password Service -  : ${response.statusCode}");
      if (response.statusCode == 200) {
        await EasyLoading.showSuccess("Password Changed");
        return true;
      } else if (response.statusCode == 422) {
        var data = jsonDecode(response.body)['message'];
        log("--------------- A L $data");
        if (data == "The confirm password field must match new password.") {
          CommonSnackBarMessage.errorMessage(text: "Password doesn't match");
        } else {
          CommonSnackBarMessage.errorMessage(text: "Password must be at least 6 digits");
        }
        return false;
      } else if (response.statusCode == 400) {
        CommonSnackBarMessage.errorMessage(text: "Current password is incorrect");
        return false;
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
