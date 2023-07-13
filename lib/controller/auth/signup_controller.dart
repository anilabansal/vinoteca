import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/services/fcm_service.dart';

import '../../common/utils/utilities.dart';
import '../../database/app_database.dart';
import '../../modal/auth/login_modal.dart';
import '../../view/app_common_widgets/progress_dialog.dart';
import '../../view/app_common_widgets/snackbar.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class SignUpController extends GetxController {
  /// TODO: VARIABLE_INITIALIZED
  RxBool isPassVisible = true.obs;
  RxBool isConfPassVisible = true.obs;
  RxBool isOldPassVisible = true.obs;
  RxBool isAgreeTerms = false.obs;
  RxBool signupLoyalty = false.obs;

  Rx<TextEditingController> emailEdt = TextEditingController().obs;
  Rx<TextEditingController> passEdt = TextEditingController().obs;
  Rx<TextEditingController> confPassEdt = TextEditingController().obs;

  Rx<TextEditingController> oldPassword = TextEditingController().obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;

  ///TODO: UPDATE_PASS_VISIBLE
  void updatePassVisible() {
    isPassVisible.value = !isPassVisible.value;
  }

  /// TODO: UPDATE_OLD_PASS_VISIBLE
  void updateOldPassVisible() {
    isOldPassVisible.value = !isOldPassVisible.value;
  }

  ///TODO: UPDATE_CONFIRM_PASS_VISIBLE
  void updateConPassVisible() {
    isConfPassVisible.value = !isConfPassVisible.value;
  }

  /// TODO: AGREE_TERMS_VALUE
  void agreeTerms() {
    isAgreeTerms.value = !isAgreeTerms.value;
  }

  /// TODO: SIGNUP_LOYALTY_PROGRAM
  void signupLoyaltyProgram() {
    signupLoyalty.value = !signupLoyalty.value;
  }

  /// TODO: VALIDATION_ERROR
  String validateSignUp() {
    if (emailEdt.value.text.trim().isEmpty) {
      return "Enter Email";
    } else if (!validateEmail(emailEdt.value.text.trim())) {
      return "Enter valid email";
    } else if (passEdt.value.text.trim().isEmpty) {
      return "Enter Password";
    } else if (confPassEdt.value.text.trim().isEmpty) {
      return "Enter Confirm Password";
    } else if (confPassEdt.value.text.trim() != passEdt.value.text.trim()) {
      return "Confirm Password not matched";
    } else if (!isAgreeTerms.value) {
      return "Please agree with the terms and services";
    }  else {
      return "";
    }
  }

  /// TODO: VALIDATE_CHANGE_PASSWORD_FIELD
  String validateChangePassword() {
    if (oldPassword.value.text.trim().isEmpty) {
      return "Enter Old Password";
    } else if (newPassword.value.text.trim().isEmpty) {
      return "Enter Password";
    } else if (confPassEdt.value.text.trim().isEmpty) {
      return "Enter Confirm Password";
    } else if (newPassword.value.text.trim() != confPassEdt.value.text.trim()) {
      return "New password and confirm password must be same";
    } else {
      return "";
    }
  }

  /// TODO: SIGNUP_API_CALL
  onClickSignUp() {
    if (validateSignUp() == "") {
      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        "Email": emailEdt.value.text,
        "Password": passEdt.value.text,
        "AuthorizationId": 0,
        "Mode": "Manual",
        "IsLoyaltySignUp": signupLoyalty.value,
        "DeviceToken": FCMService().fcmToken ?? "",
        "DeviceType": Platform.isIOS ? "Ios" : "Android",
        "TermAndConditions": true,
      }, WebServicesConstant.signUp)
          .then((value) {
        Navigator.of(Get.context!).pop();

        LoginModal modal = LoginModal.fromJson(value);
        //use usermodal to get details of signned user
        if (modal.response == 1) {
          AppLocalStorage().setLoginToken(modal.token);
          AppLocalStorage().setUserData(modal.data!.loginModel!);
          AppLocalStorage().setUserId(modal.data!.loginModel!.userId,modal.data!.loginModel!.email);
          Get.offAllNamed("/createProfile");
        } else {
          snackBarCommon("Sign Up", modal.errorMessage);
        }
      });
    } else {
      snackBarCommon("Sign Up", validateSignUp());
    }
  }

  ///TODO: CHANGE_PASSWORD_API_CALL
  onClickChangePassword() {
    if (validateChangePassword() == "") {
      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        "OldPassword": oldPassword.value.text.trim(),
        "NewPassword": newPassword.value.text.trim(),
        "ConfirmPassword": confPassEdt.value.text.trim()
      }, token: AppLocalStorage().token, WebServicesConstant.changePassword)
          .then((value) {
        Navigator.of(Get.context!).pop();

        LoginModal modal = LoginModal.fromJson(value);
        //use usermodal to get details of signned user
        if (modal.response == 1) {
          Get.offAllNamed("/login");
        } else {
          snackBarCommon("Change Password", modal.errorMessage);
        }
      });
    } else {
      snackBarCommon("Change Password", validateChangePassword());
    }
  }
}
