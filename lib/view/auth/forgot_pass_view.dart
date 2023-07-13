

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/auth/forgot_pass_controller.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_bg_widget.dart';
import '../app_common_widgets/common_button_widget.dart';

import '../app_common_widgets/common_text_widget.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  CommonAuthBgTop(imagePath: "asset/images/auth/img_forgot_illus.svg",),
                  //Todo : Bottom part of screen
                  CommonAuthBgBtm(
                    childWidget: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [

                          CommonTextWidget(msg:AppConstants.forgotPass.toUpperCase(),textSize: 22.0,font: georgiaBold,color: black000000,),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextWidget(msg:AppConstants.enterRegisterEmail,textAlign:TextAlign.center,textSize: 16.0,font: dSansRegular,color: black525252,),
                          const SizedBox(
                            height: 30,
                          ),
                          CommonTextFieldWidget(title: AppConstants.email,msg: "Enter Email",font: dSansRegular,textSize:16.0,textEditController: Get.find<ForgotPasswordController>().emailEdt.value,),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonButton(msg: AppConstants.submit,callback: (){
                          Get.find<ForgotPasswordController>().onClickSumbit();
                          },),
                          const SizedBox(
                            height: 30,
                          ),

                          InkWell(
                            onTap: (){
                            Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.arrow_back,size: 18,),
                                  const SizedBox(width: 5,),
                                  CommonTextWidget(msg: "Back To Login",),
                                ],
                              ),
                            ),
                          )
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
