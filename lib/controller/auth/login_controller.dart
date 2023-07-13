import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/database/app_database.dart';

import '../../common/utils/utilities.dart';
import '../../modal/auth/login_modal.dart';
import '../../services/fcm_service.dart';
import '../../view/app_common_widgets/progress_dialog.dart';
import '../../view/app_common_widgets/snackbar.dart';
import '../web_services/app_webservices.dart';

class LoginController extends GetxController {

  Rx<TextEditingController> emailEdt = TextEditingController().obs;
  Rx<TextEditingController> passEdt = TextEditingController().obs;
  RxBool isPassVisible = true.obs;

  /// TODO: UPDATE_PASS_VISIBLE
  void updateVisible() {
    isPassVisible.value = !isPassVisible.value;
  }

  /// TODO: VALIDATE_LOGIN
  String validateLogin() {
    if (emailEdt.value.text.trim().isEmpty) {
      return "Enter Email";
    } else if (!validateEmail(emailEdt.value.text.trim())) {
      return "Enter valid email";
    } else if (passEdt.value.text.trim().isEmpty) {
      return "Enter Password";
    } else {
      return "";
    }
  }
  /// TODO: LOGIN BUTTON CLICK
  void onClickLogin() async {
    if (validateLogin() == "") {
      ProgressDialog.showProgressDialog(Get.context!);
      //hit api
      loginApi();
    } else {
      snackBarCommon("Login", validateLogin());
    }
  }

  /// TODO: LOGIN_API_CALL
  void loginApi(){
    callPostApi(
        {"Email": emailEdt.value.text, "Password": passEdt.value.text,"DeviceToken": FCMService().fcmToken ?? "",},
        WebServicesConstant.login)
        .then((value) {
      Navigator.of(Get.context!).pop();
      LoginModal modal = LoginModal.fromJson(value);
      //TODO use login model to get details of signed user
      if (modal.response == 1) {
        AppLocalStorage().setLoginToken(modal.token);
        if (modal.data!.loginModel!.firstName != "") {
          //TODO if user profile is created to go main screen
          AppLocalStorage().setIsProfileCreated(true);
          AppLocalStorage().setIsLoginUser(true);
          AppLocalStorage().setUserData(modal.data!.loginModel!);
          AppLocalStorage().setLastLoginTime(modal.data!.loginModel!.lastLoginTime!);
          print(
              "user_Detail${AppLocalStorage().userDetail!.userId.toString()}");

          Get.offNamed("/mainScreen");
        } else {
          AppLocalStorage().setLastLoginTime(modal.data!.loginModel!.lastLoginTime!);
          AppLocalStorage().setUserId(modal.data!.loginModel!.userId,modal.data!.loginModel!.email);
          //TODO if user profile is not created to go create profile
          Get.offNamed("/createProfile");
        }
      } else {
        snackBarCommon("Login", modal.errorMessage);
      }
    });
  }



  void socialLoginApi(mode,authId,email){
    ProgressDialog.showProgressDialog(Get.context!);
    callPostApi(
        {  "Email": email,
           "AuthorizationId":authId,
          //Google / Facebook / Apple / Manual
           "Mode":mode,
           "DeviceToken": FCMService().fcmToken ?? "",
           "DeviceType":Platform.isAndroid ? "Android":"Ios","TermAndConditions":true},
        WebServicesConstant.socialLogin)
        .then((value) {
      Navigator.of(Get.context!).pop();
      LoginModal modal = LoginModal.fromJson(value);
      //TODO use login model to get details of signed user
      if (modal.response == 1) {
        AppLocalStorage().setLoginToken(modal.token);
        if (modal.data!.loginModel!.firstName != "") {
          //TODO if user profile is created to go main screen
          AppLocalStorage().setIsProfileCreated(true);
          AppLocalStorage().setIsLoginUser(true);
          AppLocalStorage().setUserData(modal.data!.loginModel!);
          AppLocalStorage().setLastLoginTime(modal.data!.loginModel!.lastLoginTime!);

          print("user_Detail${AppLocalStorage().userDetail!.userId.toString()}");

          Get.offNamed("/mainScreen");

        } else {

          AppLocalStorage().setLastLoginTime(modal.data!.loginModel!.lastLoginTime!);
          AppLocalStorage().setUserId(modal.data!.loginModel!.userId,modal.data!.loginModel!.email);
          //TODO if user profile is not created to go create profile
          Get.offNamed("/createProfile");

        }
      } else {
        snackBarCommon("Login", modal.errorMessage);
      }
    });
  }

   /// TODO: CHECK_DONT_HAVE_ACCOUNT
  void onClickDontHaveAccount() {
    Get.offNamed("/signUp");
  }
  /// TODO:
  void onClickForgotPassword() {
    Get.toNamed("/forgotPass");
  }
}
