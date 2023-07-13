

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../controller/auth/forgot_pass_controller.dart';
import '../app_common_widgets/common_bg_widget.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  CommonAuthBgTop(imagePath: "asset/images/auth/img_otp_illus.svg",),

                  //Todo : Bottom part of screen
                  CommonAuthBgBtm(
                    childWidget: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [

                          CommonTextWidget(msg:AppConstants.otpVerification.toUpperCase(),textSize: 22.0,font: georgiaBold,color: black000000,),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextWidget(msg:AppConstants.sendOtpOnMail,textAlign:TextAlign.center,textSize: 16.0,font: dSansRegular,color: black525252,),
                          const SizedBox(
                            height: 20,
                          ),

                          OTPTextField(
                            length: 4,
                            contentPadding: EdgeInsets.zero,
                            width: MediaQuery.of(context).size.width,
                            style: const TextStyle(
                                fontSize: 17
                            ),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            otpFieldStyle: OtpFieldStyle(focusBorderColor: orangeDC571F,),
                            fieldWidth: 50,
                            onCompleted: (pin) {
                              print(pin);
                              Get.find<ForgotPasswordController>().updateOtp(pin);
                            },
                            onChanged: (v){
                              print(v);
                              Get.find<ForgotPasswordController>().updateOtp(v);
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CommonTextWidget(msg:AppConstants.dontgetOtp,textAlign:TextAlign.center,textSize: 16.0,font: dSansRegular,color: black525252,),
                          InkWell(
                            onTap: (){
                              Get.find<ForgotPasswordController>().resendOtp();
                            },
                              child: Text(AppConstants.resendCode,style: const TextStyle(decoration: TextDecoration.underline,fontFamily:dSansRegular,fontSize:16.0,color: orangeDC571F ))),
                          const SizedBox(
                            height: 20,
                          ),

                          CommonButton(msg: AppConstants.verifyNow,callback: (){
                            Get.find<ForgotPasswordController>().onClickOtpSubmit();

                          },),
                          const SizedBox(
                            height: 30,
                          ),


                        ],
                      ),
                    ),)
                ],
              ),
            )
        )
    );
  }
}
