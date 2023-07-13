

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/common/common_modal.dart';
import 'package:vinoteca_app/view/app_common_widgets/bottom_sheet_common.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../modal/home/all_wines_list_modal.dart';
import '../../view/store/store_detail_view.dart';
import '../store/store_detail_controller.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class SettingController extends GetxController{

  Rx<TextEditingController> cardNo = TextEditingController().obs;
  Rx<TextEditingController> cardHolder = TextEditingController().obs;
  Rx<TextEditingController> cardCvv = TextEditingController().obs;
  Rx<TextEditingController> cardExpiry = TextEditingController().obs;

  List<WineData>? list = [];

  RxBool isLoading = true.obs;
  RxBool isLoadingWeb=true.obs;

    WebViewController? controller;
  /// TODO: ONCLICK_SETTING_OPTION
  void onClickSettingOption(int index){
    switch(index){

      case 0:
        isLoading.value=true;
        favWineList();
        Get.toNamed("/favoriteWine");
        break;
      case 1:
        Get.toNamed("/aboutUs");
        break;
      case 2:
        Get.toNamed("/contactUs");
        break;
      case 3:
        Get.toNamed("/termsServicesView");
        break;
      case 4:
        Get.find<StoreController>().updateWinesVisibility(false);
        Get.toNamed("/storeListView");

        break;
      case 5:
        Get.toNamed("/changePassword");
        break;
      case 6:
        Get.toNamed('/paymentMethods',arguments: [{"call_from":"settings"}]);
        break;
    }
  }

  onClickLogout(){
    AppLocalStorage().clearData();
    Get.offNamed("/login");
  }


  void favWineList(){

    callPostApi({
    }, token:AppLocalStorage().token,WebServicesConstant.favoriteList)
        .then((value) {
      isLoading.value=false;
      list!.clear();
      WineListModal wineListModal=WineListModal.fromJson(value);
      list!.addAll(wineListModal.data!);
      update();
      print(value);
    });
  }

  void getTersmCondition(){
    controller = WebViewController();

    callPostApi({
    }, token:AppLocalStorage().token,WebServicesConstant.termsAndConditions)
        .then((value) {
          loadData(value["data"]["termsOfServices1"]);
    });
  }

  //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

  /// TODO: DELETE_FAV_API
  void deleteFav(wineId,index){

    callPostApi({"wineId":wineId,
    },token:AppLocalStorage().token, WebServicesConstant.unFavWine)
        .then((value) {
          CommonModal model=CommonModal.fromJson(value);
          if(model.response==1){
            list!.removeAt(index);
            update();
          }

    });
  }

///TODO: ADD_CARD_API
  addCardApi(){
    callPostApi({
      // "HolderName": cardHolder.value.text,
      // "CardNumber": cardNo.value.text,
      // "cvv":int.parse(cardCvv.value.text),
      // "Expiry": cardExpiry.value.text

      "HolderName": "ramandeep kaur",
      "CardNumber": "411111111111",
      "cvv":int.parse("111"),
      "Expiry": "04/2023"
    },token:AppLocalStorage().token, WebServicesConstant.addCardPayment)
        .then((value) {
      CommonModal model=CommonModal.fromJson(value);
      if(model.response==1){
        Get.toNamed("/paymentDone");
      }

    });
  }





  loadData(data) async{

    String kNavigationExamplePage = """<!DOCTYPE html>
    <html>
    <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
    <body style='"margin: 0; padding: 0;'>
    <div>
    $data
    </div>
    </body>
    </html>""";
    await controller!.loadHtmlString(kNavigationExamplePage);
    update();
  }
}