



import 'package:get/get.dart';
import 'package:vinoteca_app/controller/web_services/reward_webservices.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/orders/checkout_final.dart';

import '../../modal/auth/login_modal.dart';
import '../../modal/home/cart_modal.dart';
import '../../view/app_common_widgets/earn_reward_dialog.dart';
import 'app_webservices.dart';

class CartWebservices{


  static Future<dynamic> cartList(CartModal modal) async {
    final response = await callPostApi(modal.toJson(),WebServicesConstant.cartListApi,token: AppLocalStorage().token);

    print(response);
    return response;
  }


  static Future<dynamic> checkStockQuantity(int wineId) async {
    final response = await callPostApi({"wineId":wineId},WebServicesConstant.checkWineQuantity,token: AppLocalStorage().token);

    print(response);
    return response;
  }


  static Future<dynamic> addOrderDetail(CheckoutModal modal) async {
    final response = await callPostApi(modal.toJson(),WebServicesConstant.addOrderDetails,token: AppLocalStorage().token);

    if(response["response"]==1){
      if(AppLocalStorage().userDetail!.isLoyaltySignUp!){
      EarnRewardDialog.showAlertDialog(Get.context!,RewardWebservices.getRewardPoints("Ordering").toString());
      bool? data= await RewardWebservices.addPointsData(3.0,"Ordering");

      if(data!=null && data) {
        LoginDetail mData = AppLocalStorage().userDetail!;
        mData.totalRewardPoints = mData.totalRewardPoints! + 3.0;
        AppLocalStorage().setUserData(LoginDetail(
            reviewCount: mData.reviewCount!,
            firstName: mData.firstName,
            lastName: mData.lastName,
            totalRewardPoints: mData.totalRewardPoints,
            phoneNumber: mData.phoneNumber,
            profilePic: mData.profilePic,
            isLoyaltySignUp:mData.isLoyaltySignUp,
            birthmonth: mData.birthmonth,
            bithday: mData.bithday));
      }
      }
    }

    print(response);
    return response;
  }




}