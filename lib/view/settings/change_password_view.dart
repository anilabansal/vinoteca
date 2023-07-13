


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../../controller/auth/signup_controller.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              children: [
                CommonToolbar(toolText: AppConstants.changePassword,),

               Expanded(
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       const SizedBox(height: 30,),
                       SvgPicture.asset("asset/images/settings/img_change_password.svg"),

                       //Todo : Bottom part of screen

                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [

                             Obx(() =>  CommonTextFieldPass(title: AppConstants.oldPassword,msg: "Enter Old Password",font:dSansRegular,textSize: 16.0,isPassVisible: Get.find<SignUpController>().isOldPassVisible.value,textEditController: Get.find<SignUpController>().oldPassword.value,callback: (){
                               Get.find<SignUpController>().updateOldPassVisible();
                             })),
                             const SizedBox(
                               height: 30,
                             ),
                             Obx(() =>  CommonTextFieldPass(title: AppConstants.newPassword,msg: "Enter New Password",font:dSansRegular,textSize: 16.0,isPassVisible: Get.find<SignUpController>().isPassVisible.value,textEditController: Get.find<SignUpController>().newPassword.value,callback: (){
                               Get.find<SignUpController>().updatePassVisible();
                             })),
                             const SizedBox(
                               height: 30,
                             ),
                             Obx(() => CommonTextFieldPass(title: AppConstants.newConfrPassword,msg: "Enter Confirm Password",font:dSansRegular,textSize: 16.0,isPassVisible: Get.find<SignUpController>().isConfPassVisible.value,textEditController: Get.find<SignUpController>().confPassEdt.value, callback: () {
                               Get.find<SignUpController>().updateConPassVisible();
                             })),

                             const SizedBox(
                               height: 30,
                             ),
                             CommonButton(msg: AppConstants.changePassword,callback: (){
                               Get.find<SignUpController>().onClickChangePassword();
                             }),
                             const SizedBox(
                               height: 30,
                             ),
                             InkWell(onTap: (){
                               Get.back();
                             },
                               child: CommonTextWidget(msg: "Cancel",font:dSansBold,textSize: 18.0,color: greyD8D8D8,),)
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               )
              ],
            )
        )
    );
  }
}
