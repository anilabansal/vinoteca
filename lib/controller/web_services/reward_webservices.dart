


import 'package:get/get.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/orders/address_info_modal.dart';
import 'package:vinoteca_app/modal/orders/checkout_final.dart';
import 'package:vinoteca_app/view/app_common_widgets/snackbar.dart';

import '../../common/utils/utilities.dart';
import '../../modal/auth/login_modal.dart';
import '../../modal/orders/square_payment_modal.dart';
import 'app_webservices.dart';
import 'cart_webservices.dart';

class RewardWebservices{



  static int getRewardId(type){
    int id;
    switch(type){

      case "InviteFriend":
        id= 1;
        break;
      case "ScanRating":
        id= 2;
        break;
      case "OpenApp24Hours":
        id= 2;
        break;
      case "Ordering":
        id= 2;
        break;
      default:
        id= 0;

    }

    return id;
  }


  static int getRewardPoints(type){
    int id;
    switch(type){

      case "InviteFriend":
        id= 30;
        break;
      case "ScanRating":
        id= 3;
        break;
      case "OpenApp24Hours":
        id= 10;
        break;
      case "Ordering":
        id= 3;
        break;
      default:
        id= 0;

    }

    return id;
  }


  static Future<bool?> addPointsData(double points,String type) async{
    //1. scanning and rating = 3 points
    //2. Invite Friend = 30 points
    //3. Open app daily = 10 points
   await callPostApi({
      "Type" : getRewardId(type),
      "Points":points
    }, token:AppLocalStorage().token,WebServicesConstant.addPointsList)
        .then((value) {
      if(value["response"]==1){
        Future.delayed(const Duration(seconds: 3),(){
          Get.back();
        });
        return true;


      }else{
        return false;
      }

    });
    return false;

  }



  static Future<void> lastLoginTimeApi() async{

    if(AppLocalStorage().userDetail!.isLoyaltySignUp!){
    if(AppLocalStorage().lastLoginTime!="")
    {
      bool isPassTime=  isTimePass24Hours(AppLocalStorage().lastLoginTime);
      print("##################################");
      if(isPassTime){

        print("Reward Taken 24 hours passed and new time added");
        print("Congratulations! You have earn 5 points");
        hitRewardAddApi();

      }else{
        AppLocalStorage().setIsOpenAppPassTime(false);
        print("*************d**************");
      }

    }else{
      hitRewardAddApi();
    }
    }
  }


  static hitRewardAddApi() async{

    await callPostApi({
      "lastLoginTime" : DateTime.now().toString(),
    }, token:AppLocalStorage().token,WebServicesConstant.lastLoginTime)
        .then((value) {
      AppLocalStorage().setLastLoginTime(DateTime.now().toString());
      AppLocalStorage().setIsOpenAppPassTime(true);
      addPointsData(10.0, "OpenApp24Hours");
      print(value);
    });
  }


}