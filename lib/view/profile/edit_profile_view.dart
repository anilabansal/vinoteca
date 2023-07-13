

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_button_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_toolbar.dart';
import '../../controller/profile/profile_controller.dart';
import 'edit_profile_helper.dart';


class EditProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children:  [
            const CommonToolbar(toolText: "Edit Profile"),
             Expanded(
               child: Column(
                 children: [
                   const EditProfileImage(),
                   const EditUserDetails(),
                   const Spacer(),
                   Align(
                     alignment: Alignment.bottomCenter,
                     child:  Padding(
                       padding: const EdgeInsets.only(left:20.0,right: 20.0),
                       child: CommonButtonIcon(
                         msg: AppConstants.update,
                         image: "asset/images/profile/img_refresh_white.svg",
                         callback: () {
                           Get.find<ProfileController>().onClickUpdateProfile();
                         },
                       ),
                     ),
                   ),
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: CommonTextButton(msg: AppConstants.cancel,callback: (){
                       Get.back();
                     },),
                   )
                 ],
               ),
             )


          ],
        ),
      ),
    );
  }

}