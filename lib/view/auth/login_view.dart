

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_bg_widget.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../../controller/auth/login_controller.dart';
import '../app_common_widgets/common_text_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SafeArea(
       child: SingleChildScrollView(
         child: Stack(
                children: [
                  CommonAuthBgTop(imagePath: "asset/images/auth/img_logo_brown.svg",),

                  //Todo : Bottom part of screen
                  CommonAuthBgBtm(
                    childWidget: Wrap(
                      children: [
                        Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonTextWidget(msg:AppConstants.login.toUpperCase(),textSize: 22.0,font: georgiaBold,color: black000000,),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextWidget(msg:AppConstants.pleaseEnterDetails,textSize: 16.0,font: dSansRegular,color: black525252,),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextFieldWidget(title: AppConstants.email,msg: "Enter Email",font: dSansRegular,textSize:16.0,textEditController: Get.find<LoginController>().emailEdt.value,),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() => CommonTextFieldPass(title: AppConstants.password,msg: "Enter Password",font:dSansRegular,textSize: 16.0,isPassVisible: Get.find<LoginController>().isPassVisible.value,callback: (){
                              Get.find<LoginController>().updateVisible();
                            },textEditController:Get.find<LoginController>().passEdt.value),),

                            Align(
                              alignment: Alignment.topRight,
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 20.0,top: 20,bottom: 20),
                                child: InkWell(
                                  onTap: (){
                                    Get.find<LoginController>().onClickForgotPassword();
                                  },
                                    child: CommonTextWidget(msg:AppConstants.forgotPass+ " ?",textSize: 14.0,font: dSansRegular,color: black525252,)),
                              ),
                            ),

                            CommonButton(msg: AppConstants.login,callback: (){
                              Get.find<LoginController>().onClickLogin();
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            const LoginWithSocail(),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: (){
                                Get.find<LoginController>().onClickDontHaveAccount();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CommonRichTextWidget(textSpanList:
                                const[
                                  TextSpan(text: "Don't have an account ?", style:TextStyle(color:black525252,fontFamily: dSansMedium,fontSize: 14.0) ),
                                  TextSpan(text: " Sign Up",style: TextStyle(color: orangeDC571F,fontFamily: dSansBold,fontSize: 14.0))]),
                              ),
                            )
                          ],
                        ),
                  ),
                      ],
                    ),)
               ],
             ),
       )
     )
    );
  }
}
