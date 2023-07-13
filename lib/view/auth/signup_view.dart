
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/auth/signup_controller.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_bg_widget.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  CommonAuthBgTop(imagePath: "asset/images/auth/img_logo_brown.svg",),

                  //Todo : Bottom part of screen
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Wrap(
                      children: [
                        CommonAuthBgBtm(
                          childWidget: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                CommonTextWidget(msg:AppConstants.signUp.toUpperCase(),textSize: 22.0,font: georgiaBold,color: black000000,),
                                const SizedBox(
                                  height: 20,
                                ),
                                CommonTextWidget(msg:AppConstants.createYourAccount,textSize: 16.0,font: dSansRegular,color: black525252,),
                                const SizedBox(
                                  height: 20,
                                ),
                                CommonTextFieldWidget(title: AppConstants.email,msg: "Enter Email",font: dSansRegular,textSize:16.0,textEditController: Get.find<SignUpController>().emailEdt.value),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() =>  CommonTextFieldPass(title: AppConstants.password,msg: "Enter Password",font:dSansRegular,textSize: 16.0,textEditController: Get.find<SignUpController>().passEdt.value,isPassVisible: Get.find<SignUpController>().isPassVisible.value,callback: (){
                                  Get.find<SignUpController>().updatePassVisible();
                                },),),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() => CommonTextFieldPass(title: AppConstants.confpassword,msg: "Enter Confirm Password",font:dSansRegular,textSize: 16.0,textEditController: Get.find<SignUpController>().confPassEdt.value,isPassVisible: Get.find<SignUpController>().isConfPassVisible.value, callback: () {
                                  Get.find<SignUpController>().updateConPassVisible();
                                },),),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child:  Padding(
                                    padding: const EdgeInsets.only(top: 20,bottom: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(width:25,height: 25,child: Theme(
                                          data: Theme.of(context).copyWith(
                                            unselectedWidgetColor: Colors.grey,
                                          ),
                                          child: Obx(()=> Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(3)),
                                            value: Get.find<SignUpController>().isAgreeTerms.value,
                                            onChanged: (value) {
                                               Get.find<SignUpController>().agreeTerms();
                                            },
                                          )),
                                        )),
                                       const SizedBox(
                                          width: 10,
                                        ),
                                        CommonTextWidget(msg:AppConstants.readtermNcond,textSize: 14.0,font: dSansRegular,color: black525252,),
                                        Text(" ${AppConstants.termNcond}",style: const TextStyle(decoration: TextDecoration.underline,fontFamily:dSansRegular,fontSize:14.0,color: black525252 )),
                                       // CommonTextWidget(msg:" "+AppConstants.termNcond,textSize: 14.0,font: dSansRegular,color: black525252,),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child:  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(width:25,height: 25,child: Theme(
                                          data: Theme.of(context).copyWith(
                                            unselectedWidgetColor: Colors.grey,
                                          ),
                                          child: Obx(()=> Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(3)),
                                            value: Get.find<SignUpController>().signupLoyalty.value,
                                            onChanged: (value) {
                                              Get.find<SignUpController>().signupLoyaltyProgram();
                                            },
                                          )),
                                        )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CommonTextWidget(msg:"Sign Up as",textSize: 14.0,font: dSansRegular,color: black525252,),
                                        const Text(" Loyalty program",style: TextStyle(fontFamily:dSansBold,fontSize:14.0,color: orangeDC571F )),
                                        // CommonTextWidget(msg:" "+AppConstants.termNcond,textSize: 14.0,font: dSansRegular,color: black525252,),
                                      ],
                                    ),
                                  ),
                                ),

                                CommonButton(msg: AppConstants.signUp,callback: (){
                                 Get.find<SignUpController>().onClickSignUp();

                                },),


                                const SizedBox(
                                  height: 20,
                                ),

                                InkWell(
                                  onTap: (){
                                    Get.toNamed("/login");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CommonRichTextWidget(textSpanList:
                                    const[
                                      TextSpan(text: "Already have an account ?", style:TextStyle(fontSize:16.0,color:black525252,fontFamily: dSansMedium) ),
                                      TextSpan(text: " Sign In",style: TextStyle(fontSize:16.0,color: orangeDC571F,fontFamily: dSansBold))]),
                                  ),
                                )
                              ],
                            ),
                          ),),
                      ],
                    ),
                  )
                ],
              )
            )
        )
    );
  }
}
