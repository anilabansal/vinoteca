
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/auth/forgot_pass_controller.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_bg_widget.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../../controller/auth/signup_controller.dart';
import '../app_common_widgets/common_text_widget.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller=Get.put(ForgotPasswordController());
    return  Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  CommonAuthBgTop(imagePath: "asset/images/auth/img_resetpass_illus.svg",),

                  //Todo : Bottom part of screen
                  CommonAuthBgBtm(
                    childWidget: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonTextWidget(msg:AppConstants.resetPass.toUpperCase(),textSize: 22.0,font: georgiaBold,color: black000000,),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextWidget(msg:AppConstants.enterNewPass,textAlign:TextAlign.center,textSize: 16.0,font: dSansRegular,color: black525252,),
                          const SizedBox(
                            height: 30,
                          ),
                           Obx(() =>  CommonTextFieldPass(title: AppConstants.newPassword,msg: "Enter New Password",font:dSansRegular,textSize: 16.0,isPassVisible: Get.find<SignUpController>().isPassVisible.value,textEditController: Get.find<ForgotPasswordController>().newPassordEdt.value,callback: (){
                            Get.find<SignUpController>().updatePassVisible();
                          })),
                          const SizedBox(
                            height: 30,
                          ),
                          Obx(() => CommonTextFieldPass(title: AppConstants.newConfrPassword,msg: "Enter Confirm Password",font:dSansRegular,textSize: 16.0,isPassVisible: Get.find<SignUpController>().isConfPassVisible.value,textEditController: Get.find<ForgotPasswordController>().confrmPassordEdt.value, callback: () {
                            Get.find<SignUpController>().updateConPassVisible();
                          })),

                          const SizedBox(
                            height: 20,
                          ),
                          CommonButton(msg: AppConstants.submit,callback: (){
                            //Get.offAllNamed("/login");
                            Get.find<ForgotPasswordController>().onClickResetPassword();
                          },),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ))
                ],
              ),
            )
        )
    );
  }
}
