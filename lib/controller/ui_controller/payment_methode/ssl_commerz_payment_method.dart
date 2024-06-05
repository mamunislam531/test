

 import 'package:alladin_e_store/view/screen/shipping_&_checkout/order_success/order_successful.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sslcommerz/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCShipmentInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController{
  RxBool codValueEnable = false.obs;
  RxBool paymentDone = true.obs;
  RxBool buttonEnable = false.obs;
  RxString selectMethode = "".obs;


  // Customize Information
  Future<void> sslCommerzCustomizedCall() async {


    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        ipn_url: "www.ipnurl.com",
        multi_card_name: "masterx",
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: "mamun6629dffd4b834",
        store_passwd: "mamun6629dffd4b834@ssl",
        total_amount: 500,
        tran_id: "1234567891012",
      ),
    );

    sslcommerz.addShipmentInfoInitializer(
        sslcShipmentInfoInitializer: SSLCShipmentInfoInitializer(
            shipmentMethod: "yes",
            numOfItems: 5,
            shipmentDetails: ShipmentDetails(
                shipAddress1: "Ship address 1", shipCity: "Faridpur", shipCountry: "Bangladesh", shipName: "Ship name 1", shipPostCode: "7860")));

    sslcommerz.addCustomerInfoInitializer(
        customerInfoInitializer: SSLCCustomerInfoInitializer(
            customerState: "Chattogram",
            customerName: "Abu Sayed Chowdhury",
            customerEmail: "sayem227@gmail.com",
            customerAddress1: "Chattogram",
            customerCity: "Chattogram",
            customerPostCode: "200",
            customerCountry: "Bangladesh",
            customerPhone: "01761810533"));

    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();
      debugPrint("=======================================================================");
      debugPrint("=======================================================================");
      debugPrint("=======  status}     ${result.status}    =========");
      debugPrint("=======  amount}     ${result.amount}    =========");
      debugPrint("=======  aPIConnect  ${result.aPIConnect}    =========");
      debugPrint("=======  bankTranId  ${result.bankTranId}    =========");
      debugPrint("=======  baseFair}   ${result.baseFair}    =========");
      debugPrint("=======  cardBrand}  ${result.cardBrand}    =========");
      debugPrint("=======  cardIssuer  ${result.cardIssuerCountry}    =========");
      debugPrint("=======  cardIssuer  ${result.cardIssuerCountryCode}    =========");
      debugPrint("=======  cardNo}     ${result.cardNo}    =========");
      debugPrint("=======  cardType}   ${result.cardType}    =========");
      debugPrint("=======  currencyAm  ${result.currencyAmount}    =========");
      debugPrint("=======  currencyRa  ${result.currencyRate}    =========");
      debugPrint("=======  currencyTy  ${result.currencyType}    =========");
      debugPrint("=======  gwVersion}  ${result.gwVersion}    =========");
      debugPrint("=======  riskLevel}  ${result.riskLevel}    =========");
      debugPrint("=======  riskTitle}  ${result.riskTitle}    =========");
      debugPrint("=======  sessionkey  ${result.sessionkey}    =========");
      debugPrint("=======  storeAmoun  ${result.storeAmount}    =========");
      debugPrint("=======  tranDate}   ${result.tranDate}    =========");
      debugPrint("=======  tranId}     ${result.tranId}    =========");
      debugPrint("=======  validatedO  ${result.validatedOn}    =========");
      debugPrint("=======  valueA}     ${result.valueA}    =========");
      debugPrint("=======  valueB}     ${result.valueB}    =========");
      debugPrint("=======  valueC}     ${result.valueC}    =========");
      debugPrint("=======  valueD}     ${result.valueD}    =========");
      debugPrint("=======================================================================");
      debugPrint("=======================================================================");

      if (result.status!.toLowerCase() == "failed") {
       await EasyLoading.showError("Payment Failed..!!".tr,duration: const Duration(seconds: 2));
      } else if (result.status!.toLowerCase() == "closed") {
        await EasyLoading.showError("Payment Cancelled by User".tr,duration: const Duration(seconds: 2));
      }
      else {
        await EasyLoading.showSuccess("successful".tr);
        paymentDone.value = true;
        buttonEnable.value = true;
        Get.offAll(
          const OrderSuccessful(),
          popGesture: true,opaque: false,fullscreenDialog: false,
          curve: Curves.easeIn,
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 600),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}