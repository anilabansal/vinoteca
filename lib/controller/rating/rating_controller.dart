




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vinoteca_app/controller/web_services/reward_webservices.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/common/common_modal.dart';

import '../../modal/auth/login_modal.dart';
import '../../modal/auth/profile_modal.dart';
import '../../view/app_common_widgets/common_crop_image_widget.dart';
import '../../view/app_common_widgets/earn_reward_dialog.dart';
import '../../view/app_common_widgets/progress_dialog.dart';
import '../../view/app_common_widgets/snackbar.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';


class RatingController extends GetxController{


  TextEditingController ratingReviewController = TextEditingController();
  double tourRating=0.0;


  updateRating(rating){
    tourRating=rating;
  }






  rateWineOrTourGuide(id){
    ProgressDialog.showProgressDialog(Get.context!);

    callPostApi({
      "wineid":id,
      "ratings1":tourRating,
      "review":ratingReviewController.value.text
    }, token:AppLocalStorage().token,WebServicesConstant.rateWineOrTourGuide)
        .then((value) async {
          Get.back();
          if(value["response"]==1){
            if(AppLocalStorage().userDetail!.isLoyaltySignUp!){
              EarnRewardDialog.showAlertDialog(Get.context!,RewardWebservices.getRewardPoints("ScanRating").toString());
              bool? data= await RewardWebservices.addPointsData(3.0,"ScanRating");

              if(data!=null && data){
                LoginDetail mdata=AppLocalStorage().userDetail!;
                mdata.totalRewardPoints=mdata.totalRewardPoints!+3.0;
                AppLocalStorage().setUserData(LoginDetail(isLoyaltySignUp:mdata.isLoyaltySignUp,reviewCount:mdata.reviewCount!,firstName: mdata.firstName,lastName: mdata.lastName,
                    totalRewardPoints:mdata.totalRewardPoints, phoneNumber:mdata.phoneNumber,profilePic: mdata.profilePic,birthmonth: mdata.birthmonth,bithday:mdata.bithday));

                Get.offNamed('/ratingDone');
              }
            }else{
              Get.offNamed('/ratingDone');
            }

          }

    });
  }



}