import 'dart:developer';

import 'package:alladin_e_store/controller/api_controller/order_store.dart';
import 'package:alladin_e_store/utils/app_data.dart';
import 'package:alladin_e_store/view/screen/shipping_&_checkout/order_success/order_successful.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BkashPaymentMethodController extends GetxController {
  RxBool codValueEnable = false.obs;
  RxBool paymentDone = true.obs;
  RxBool buttonEnable = false.obs;
  RxBool isLoading = false.obs;
  RxString trxID = "".obs;

  // Payment Implement
  bKashPayment({required BuildContext context, required double payAmount, required Map data}) async {
    log("PPPPPPP : $data");

    final flutterBkash = FlutterBkash(
      bkashCredentials: BkashCredentials(
        username: AppData.paymentBksUserName,
        password: AppData.paymentBksUserPass,
        appKey: AppData.paymentBksKey,
        appSecret: AppData.paymentBksSecret,
        isSandbox: false,
      ),
    );

    try {
      final result = await flutterBkash.pay(
        context: context,
        amount: double.parse(payAmount.toString()),
        merchantInvoiceNumber: "MamunIslam01761810531",
        payerReference: "Mamun",
      );
      debugPrint(result.paymentId);
      await EasyLoading.showSuccess("Payment Successful");
      log("------ trxId   : ${result.trxId}  paymentId  :${result.paymentId} ----------------");
      if (result.trxId.isEmpty) {
        log("------ Empty ----------------");
      } else {
        bool status = await OrderStoreService.orderStoreService(data: data, trxID: "${result.trxId}-${result.paymentId}", payMode: "BKash");
        trxID.value = result.trxId;
        if (status) {
          Get.offAll(() => const OrderSuccessful());
        }
      }
    } on BkashFailure {
      await EasyLoading.showError("Payment Failed");
      log("------ Payment Failed BkashFailure----------------");
    } catch (e) {
      await EasyLoading.showError("Payment Failed,\nSomething went wrong.");
      log("------ Payment Failed  Something Wrong----------------");
    }
    return;
  }
}
