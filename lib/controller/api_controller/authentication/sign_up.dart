import 'dart:convert';
import 'package:alladin_e_store/controller/api_controller/api_base_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  static Future<bool> signUpService({required String email, required String phone,required String password,required String conPassword,}) async {
    try {
      Uri url = Uri.parse(ApiBaseUrl.signUpUrl);
      var body = {
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": conPassword
      };
      Map<String, String> headers = {"Content-type": "application/json", "Accept": "application/json"};
      var response = await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 201) {
        await EasyLoading.showSuccess("Sign Up Successful");
        return true;
      } else if (response.statusCode == 422) {
        var responseData = jsonDecode(response.body)['errors'];

        if(responseData['email'] != null){
          await EasyLoading.showError("This Email Already Used");
          return false;
        }else  if(responseData['phone'] != null){
          await EasyLoading.showError("This Phone Already Used");
          return false;
        }
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
