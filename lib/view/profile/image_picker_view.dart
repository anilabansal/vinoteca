



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/controller/auth/create_profile_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';

import '../../common/utils/common_font.dart';
import '../../controller/profile/profile_controller.dart';
import '../app_common_widgets/common_all_widget.dart';

class ImagePickerView {
  static void showPicker(isCreateProfile) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height*0.2,
        decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.only(
            topLeft:  Radius.circular(25.0),
            topRight:  Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CloseButtonCommon(width: 30,height: 30,),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                    if(isCreateProfile){
                      Get.find<CreateProfileController>().pickImageFromGallery();
                    }else{
                      Get.find<ProfileController>().pickImageFromGallery();
                    }

                  },
                  child: Column(
                    children: [
                      const Icon(Icons.photo,size: 50,color: orangeDC571F,),
                      const SizedBox(height: 10,),
                      CommonTextWidget(msg:"Photos",textSize: 12.0,font: dSansMedium,color: orangeDC571F),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.back();
                    if(isCreateProfile){
                      Get.find<CreateProfileController>().pickImageFromCamera();
                    }else{
                      Get.find<ProfileController>().pickImageFromCamera();

                    }

                  },
                  child: Column(
                    children: [
                      const Icon(Icons.camera,size: 50,color: orangeDC571F,),
                      const SizedBox(height: 10,),
                      CommonTextWidget(msg:"Camera",textSize: 12.0,font: dSansMedium,color: orangeDC571F),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),),

    );
  }
}





