


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:uuid/uuid.dart';
import 'package:vinoteca_app/controller/web_services/app_webservices.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/home/all_wines_list_modal.dart';
import 'package:vinoteca_app/view/app_common_widgets/progress_dialog.dart';
import 'package:vinoteca_app/view/app_common_widgets/snackbar.dart';
import 'package:vinoteca_app/view/payment/payment_processing.dart';

import '../../view/payment_demo/config.dart';
import '../../view/payment_demo/dialog_modal.dart';
import '../../view/payment_demo/transaction_service.dart';
import '../web_services/payment_webservices.dart';
import '../web_services/webservices_constants.dart';

class SquarePaymentController extends GetxController{


  @override
  onInit(){
    super.onInit();
  }

  Future<void> payWithAnyCardDetails() async{
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow,
        collectPostalCode: false);
  }

  void _onCardEntryComplete() {

    //if (_chargeServerHostReplaced) {
    //   showAlertDialog(
    //       context: Get.context!,
    //       title: "Congratulation,Your order was successful",
    //       description:
    //       "Go to your Square dashboard to see this order reflected in the sales tab.",
    //       status: true);
    //}


  }

  void _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
    // if (!_chargeServerHostReplaced) {
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
      _showUrlNotSetAndPrintCurlCommand(result.nonce);
     // return;
    //}
    try {
      //await PaymentWebservices.reportPaymentToServer();
      print("nonceException${_onCardEntryComplete}");
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
    } on ChargeException catch (ex) {
      print("nonceException$ex");
      InAppPayments.showCardNonceProcessingError(ex.errorMessage);
    }

  }


  void _showUrlNotSetAndPrintCurlCommand(String nonce,
      {String? verificationToken}) {
    String title;
    // if (verificationToken != null) {
    //   title = "Nonce and verification token generated but not charged";
    // } else {
    //   title = "Nonce generated but not charged";
    // }
    // showAlertDialog(
    //     context: Get.context!,
    //     title: title,
    //     description:
    //     "Check your console for a CURL command to charge the nonce, or replace CHARGE_SERVER_HOST with your server host.",
    //     status: true);

    Get.to(()=> const PaymentProcessing());
    var uuid = Uuid().v4();
    printCurlCommand(nonce, verificationToken,uuid);
    PaymentWebservices.checkoutWithSquare(uuid,100.00,nonce);
  }

  void _onCancelCardEntryFlow() {
    //_showOrderSheet();
  }



  void printCurlCommand(String nonce, String? verificationToken,uuid) {
    var hostUrl = 'https://connect.squareup.com';
    if (squareApplicationId.startsWith('sandbox')) {
      hostUrl = 'https://connect.squareupsandbox.com';
    }


    if (verificationToken == null) {
      print('curl --request POST $hostUrl/v2/payments \\'
          '--header \"Content-Type: application/json\" \\'
          '--header \"Square-Version: 2022-01-10\" \\'
          '--header \"Authorization: Bearer EAAAEK-TqP7jJX02rLCYX4hLb3rv33tfSoIQt50DfZvPQRgQRTRa6dLFSyDkUxsu\" \\'
          '--header \"Accept: application/json\" \\'
          '--data \'{'
          '\"idempotency_key\": \"$uuid\",'
          '\"amount_money\": {'
          '\"amount\": ${100},'
          '\"currency\": \"USD\"},'
          '\"source_id\": \"$nonce\"'
          '}\'');
    } else {
      print('curl --request POST $hostUrl/v2/payments \\'
          '--header \"Content-Type: application/json\" \\'
          '--header \"Square-Version: 2022-01-10\" \\'
          '--header \"Authorization: Bearer EAAAEK-TqP7jJX02rLCYX4hLb3rv33tfSoIQt50DfZvPQRgQRTRa6dLFSyDkUxsu\" \\'
          '--header \"Accept: application/json\" \\'
          '--data \'{'
          '\"idempotency_key\": \"$uuid\",'
          '\"amount_money\": {'
          '\"amount\": ${100},'
          '\"currency\": \"USD\"},'
          '\"source_id\": \"$nonce\",'
          '\"verification_token\": \"$verificationToken\"'
          '}\'');
    }
  }

}