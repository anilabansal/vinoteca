import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/database/app_database.dart';

import '../../common/utils/utilities.dart';
import '../../modal/common/common_modal.dart';
import '../../view/app_common_widgets/progress_dialog.dart';
import '../../view/app_common_widgets/snackbar.dart';
import '../web_services/app_webservices.dart';

class ForgotPasswordController extends GetxController {
  Rx<TextEditingController> emailEdt = TextEditingController().obs;
  Rx<TextEditingController> newPassordEdt = TextEditingController().obs;
  Rx<TextEditingController> confrmPassordEdt = TextEditingController().obs;
  Rx<String> otpPin = "".obs;

  int? userId;

  String validateLogin() {
    if (emailEdt.value.text.trim().isEmpty) {
      return "Enter Email";
    } else if (!validateEmail(emailEdt.value.text.trim())) {
      return "Enter valid email";
    } else {
      return "";
    }
  }

  void updateOtp(pin) {
    otpPin.value = pin;
  }

  void onClickSumbit() async {
    if (validateLogin() == "") {
      //hit api
      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        "email": emailEdt.value.text,
      }, WebServicesConstant.forgotPass)
          .then((value) {
        Navigator.of(Get.context!).pop();
        CommonModal modal = CommonModal.fromJson(value);
        if (modal.response == 1) {
          userId = value["data"]["userId"];
          AppLocalStorage().setUserId(userId,"");
          snackBarCommon("Forgot Password", modal.errorMessage);
          Get.toNamed("/otpVerify");
        } else {
          snackBarCommon("Forgot Password", modal.errorMessage);
        }
      });
    } else {
      snackBarCommon("Forgot Password", validateLogin());
    }
  }

  /// TODO:
  void onClickDontHaveAccount() {
    Get.toNamed("/signUp");
  }

  void onClickForgotPassword() {
    Get.toNamed("/forgotPass");
  }

  onClickOtpSubmit() {
    if (otpPin.value != "" && otpPin.value.length > 3) {
      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        "UserId": userId,
        "Otp": int.parse(otpPin.value),
      }, WebServicesConstant.otpSubmit)
          .then((value) {
        Get.back();
        CommonModal modal = CommonModal.fromJson(value);

        if (modal.response == 1) {
          Get.toNamed("/otpVerificationDone");
        } else {
          snackBarCommon("Otp Verify", modal.errorMessage);
        }
      });
    } else {
      snackBarCommon("Otp Verify", "Enter otp");
    }
  }

///TODO:  RESEND_OTP_API
  resendOtp() {
    ProgressDialog.showProgressDialog(Get.context!);
    callPostApi({"UserId": userId}, WebServicesConstant.resendOtp)
        .then((value) {
      Get.back();
      CommonModal modal = CommonModal.fromJson(value);
      if (modal.response == 1) {
        snackBarCommon("Otp Verify", modal.errorMessage);
      } else {
        snackBarCommon("Otp Verify", modal.errorMessage);
      }
    });
  }

  ///TODO: RESET_PASSWORD_VALIDATION
  validateResetPassword() {
    if (newPassordEdt.value.text.trim().isEmpty) {
      snackBarCommon("Reset Password", "Enter new password");
      return false;
    } else if (confrmPassordEdt.value.text.trim().isEmpty) {
      snackBarCommon("Reset Password", "Enter confirm password");
      return false;
    } else if (newPassordEdt.value.text.trim() !=
        confrmPassordEdt.value.text.trim()) {
      snackBarCommon(
          "Reset Password", "New password and confirm password must be same");
      return false;
    } else {
      return true;
    }
  }

  ///TODO: RESET_PASSWORD_API_CALL
  onClickResetPassword() {
    if (validateResetPassword()) {
      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        "UserId": AppLocalStorage().userIdTemp,
        "Password": newPassordEdt.value.text.trim()
      }, WebServicesConstant.resetPassword)
          .then((value) {
        Get.back();
        CommonModal modal = CommonModal.fromJson(value);
        if (modal.response == 1) {
          AppLocalStorage().setUserId(0,"");
          snackBarCommon("Reset Password", "Password reset successfully.....");
          Get.offAllNamed("/login");
        } else {
          snackBarCommon("Reset Password", modal.errorMessage);
        }
      });
    }
  }
}
