


import 'package:get/get.dart';

import '../../database/app_database.dart';
import '../../modal/orders/order_detail_modal.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class OrderDetailController extends GetxController{
  dynamic argumentData = Get.arguments;
  OrderDetailModal? modal;

  Rx<bool> isLoading=true.obs;
  @override
  void onInit() {
    super.onInit();

    callOrderListApi(argumentData[0]["orderId"]);
  }

  callOrderListApi(orderId){
    callPostApi({"orderId":orderId},token:AppLocalStorage().token,WebServicesConstant.orderDetail )
        .then((value) {
      isLoading.value=false;
       modal =OrderDetailModal.fromJson(value);

       update();
    });
  }

}