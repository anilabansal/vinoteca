

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/utilities.dart';
import 'package:vinoteca_app/database/app_database.dart';

import '../../modal/common/common_modal.dart';
import '../../view/app_common_widgets/progress_dialog.dart';
import '../../view/app_common_widgets/snackbar.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class ContactController extends GetxController{


  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> message = TextEditingController().obs;
  Rx<TextEditingController> subject = TextEditingController().obs;


  @override
  void onInit() {
    // name.value.text=AppLocalStorage().userDetail!.firstName! +" "+AppLocalStorage().userDetail!.lastName!;
    // email.value.text=AppLocalStorage().userDetail!.email!;

    if(AppLocalStorage().userDetail!.firstName!=null){

      name.value.text="${AppLocalStorage().userDetail!.firstName!} ${AppLocalStorage().userDetail!.lastName!}";
      email.value.text=AppLocalStorage().userDetail!.email!;

    }else{
      name.value.text="";
      email.value.text="";
    }

    super.onInit();
  }

  onClickSendMessage(){

    if(validateContactUs()){

      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        "Message": message.value.text.trim(),

      },token:AppLocalStorage().token, WebServicesConstant.contactUs)
          .then((value) {
        Navigator.of(Get.context!).pop();
        CommonModal modal = CommonModal.fromJson(value);
        if (modal.response == 1) {
          Get.back();
          snackBarCommon("Contact Us", "Your request submitted successfully.");
        } else {
          snackBarCommon("Contact Us", modal.errorMessage);
        }
      });
    }

  }


  validateContactUs(){

    if(name.value.text.trim().isEmpty){
      snackBarCommon("Contact Us", "Enter Name");
      return false;
    }else if(email.value.text.trim().isEmpty){
      snackBarCommon("Contact Us", "Enter Email");
      return false;
    }else if(!validateEmail(email.value.text.trim())){
      snackBarCommon("Contact Us", "Enter Valid Email");
      return false;
    }else if(message.value.text.trim().isEmpty){
      snackBarCommon("Contact Us", "Enter Message");
      return false;
    }else{
      return true;
    }
  }


  validateHelpCenter(){

    if(name.value.text.trim().isEmpty){
      snackBarCommon("Help Center", "Enter Name");
      return false;
    }else if(email.value.text.trim().isEmpty){
      snackBarCommon("Help Center", "Enter Email");
      return false;
    }else if(!validateEmail(email.value.text.trim())){
      snackBarCommon("Help Center", "Enter Valid Email");
      return false;
    }else if(subject.value.text.trim().isEmpty){
      snackBarCommon("Help Center", "Enter Subject");
      return false;
    }else if(message.value.text.trim().isEmpty){
      snackBarCommon("Help Center", "Enter Message");
      return false;
    }else{
      return true;
    }
  }


  onClickSubmitHelpCenter(){
    if(validateHelpCenter()){
      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        "Message": message.value.text.trim(),
        "Subject":subject.value.text.trim()
      },token:AppLocalStorage().token, WebServicesConstant.helpCenter)
          .then((value) {

        Navigator.of(Get.context!).pop();
        CommonModal modal = CommonModal.fromJson(value);
        if (modal.response == 1) {
         // Navigator.of(Get.context!).pop();
          snackBarCommon("Help Center", "Your request submitted successfully.");
        } else {
          snackBarCommon("Help Center", modal.errorMessage);
        }
      });

    }
  }

}