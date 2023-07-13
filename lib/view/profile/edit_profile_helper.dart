

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';
import 'package:vinoteca_app/database/app_database.dart';
import '../../common/utils/common_font.dart';
import '../../common/utils/common_strings.dart';
import '../app_common_widgets/bottom_sheet_common.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_image_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../auth/create_profile_helper.dart';
import 'image_picker_view.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        GetBuilder<ProfileController>(builder: (controller){
          return controller.isLocalImage.isFalse ? CircularImageView(
              imageWidth: 120,
              imageHeight: 120,
              image: controller.imageUrl.value) : CircularImageView(
              imageWidth: 120,
              imageHeight: 120,
              fileImage: controller.imagePath.value);}),
        Positioned(
            right: 5,
            bottom: 0,
            child: InkWell(
              onTap: () {
                ImagePickerView.showPicker(false);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child:  const Icon(Icons.camera_alt, color: yellowEEB83E),
              ),
            ))
      ]
    );
  }
}

class EditUserDetails extends StatelessWidget {
  const EditUserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GetBuilder<ProfileController>(builder: (controller) {
        return Column(
          children: [
            CommonTextFieldWidget(
              title: AppConstants.name,
              msg: "Enter Name",
              font: dSansRegular,
              textSize: 14.0,
              textEditController: controller.name.value,
            ),
            const SizedBox(
              height: 20,
            ),
            CommonTextFieldWidget(
              title: AppConstants.contactNumber,
              msg: "Enter Contact Number",
              font: dSansRegular,
              textSize: 14.0,
              textEditController: controller.mobileNo.value,
              inputType: TextInputType.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() =>  Row(
                children: [

                  Expanded(child: CommonDatePickWidget(title: "${AppConstants.birthdayMonth}*",hint :"Month",msg: Get.find<ProfileController>().month.value!="" ? Get.find<ProfileController>().month.value:"",font: dSansRegular,textSize:16.0,callback: (){

                    //TODO show month picker
                    ShowPicker.showTimePicker(context, DateTime.now(),true);

                  })),
                  const SizedBox(width: 10,),
                  Expanded(child: CommonDatePickWidget(title: "${AppConstants.birthdayDate}*",hint :"Date",msg: Get.find<ProfileController>().date.value!="" ? Get.find<ProfileController>().date.value:"",font: dSansRegular,textSize:16.0,callback: (){
                    //TODO show date picker
                    ShowPicker.showTimePicker(context, DateTime.now(),true);
                  })),

                ]
            )),
            const SizedBox(
              height: 20,
            ),

          ],
        );
      }),
    );
  }
}
