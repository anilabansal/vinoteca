





import 'package:get/get.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/orders/address_info_modal.dart';
import 'package:vinoteca_app/modal/orders/checkout_final.dart';

import '../../modal/orders/square_payment_modal.dart';
import 'app_webservices.dart';
import 'cart_webservices.dart';

class PaymentWebservices{


  static Future<dynamic> reportPaymentToServer() async {
    final response = await callPostApiPayments(
        {},WebServicesConstant.cardPayment,);
    return response;
  }


  static Future<dynamic> checkoutWithSquare(String uuid,double amount,String nonce) async {
    final response = await callPostApiPayments(
        {"idempotency_key": uuid,"amount_money": {"amount": amount,"currency": "USD"},"source_id": nonce},WebServicesConstant.cardPayment,token: "EAAAEK-TqP7jJX02rLCYX4hLb3rv33tfSoIQt50DfZvPQRgQRTRa6dLFSyDkUxsu");
    SquarePaymentModal modal= SquarePaymentModal.fromJson(response);
    if(modal.payment!.status!.toUpperCase()=="COMPLETED"){
      CheckoutModal checkoutModal=Get.find<CartController>().checkoutModal!;
      checkoutModal.transectionId=modal.payment!.id!;
      CartWebservices.addOrderDetail(checkoutModal).then((value) {
        if(value!=null){
         Get.toNamed("/paymentDone");
        }
      });
    }

    return response;
  }




  static Future<AddressData?> getAddressInfo() async {
    final response = await callPostApi(
        {},token:AppLocalStorage().token,WebServicesConstant.addressInfo);
    print("response$response");

    AddressModal modal=AddressModal.fromJson(response);
    return modal.data;
  }



}