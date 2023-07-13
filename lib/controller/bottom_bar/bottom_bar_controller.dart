
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/web_services/reward_webservices.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/view/app_common_widgets/earn_reward_dialog.dart';
import 'package:vinoteca_app/view/app_common_widgets/snackbar.dart';
import 'package:vinoteca_app/view/bottom_bar/home/home_view.dart';
import 'package:vinoteca_app/view/order_history/history_view.dart';
import 'package:vinoteca_app/view/profile/profile_view.dart';
import 'package:vinoteca_app/view/settings/setting_view.dart';

import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class BottomBarController extends GetxController{

  int selectedIndex = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(AppLocalStorage().isOpenAppRewardTaken){

        EarnRewardDialog.showAlertDialog(Get.context!,RewardWebservices.getRewardPoints("OpenApp24Hours").toString());


        Future.delayed(const Duration(seconds: 5),(){
          Get.back();
        });
      }
    });
    getNotification();

  }

  void  onClickOption(index){
    print("selectedtab..... ${index}");
    selectedIndex=index;
    update();
  }




  Widget showWidget(){
    if(selectedIndex==0){
      return const HomeView();
    }else  if(selectedIndex==1){
      return OrderHistoryView();
    }else  if(selectedIndex==2){
      return const SettingView();
    }else  if(selectedIndex==3){
      return ProfileView();
    }
    return const HomeView();
  }


  getNotification(){
    callPostApi({
    },token:AppLocalStorage().token, WebServicesConstant.notificationList)
        .then((value) {
      print(value);

    });
  }
} 