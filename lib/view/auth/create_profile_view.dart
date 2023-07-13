

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/view/profile/image_picker_view.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../controller/auth/create_profile_controller.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import 'create_profile_helper.dart';

class CreateProfileView extends StatelessWidget {
   CreateProfileView({Key? key}) : super(key: key);


 final  List<String> list=["Yes, I want to receive emails for product specials, announcements and initiatives.",
                           "Yes, I want to receive SMS messages for product specials, announcements and initiatives.",
                           "By signing up, you agree to rewards and application Terms & Conditions, Privacy Policy and Cookie Policy."];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CommonTextWidget(msg:AppConstants.createProfile.toUpperCase(),textSize: 22.0,font: georgiaBold,color: black000000,),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonTextWidget(msg:AppConstants.pleasefilldetails,textSize: 16.0,font: dSansRegular,color: black525252,),
                    const SizedBox(
                      height: 20,
                    ),

                    GetBuilder<CreateProfileController>(builder: (controller){
                      File? image;
                      if(controller.imagePath.isNotEmpty){
                        print("filepath${controller.imagePath}");
                        image=File(controller.imagePath.value);
                      }
                      return Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade100,width: 1),
                                shape: BoxShape.circle,
                                color: Colors.grey.shade100
                            ),
                            child: ClipOval(child: controller.imagePath.isEmpty? const Icon(Icons.person,color: Colors.grey,size: 60,) : Image.file(image!,fit: BoxFit.fill,)),
                          ),
                          Positioned(right:5,bottom: 0,child: InkWell(
                            onTap: (){
                              ImagePickerView.showPicker(true);
                              // Get.find<CreateProfileController>().pickImageFromGallery();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(color: Colors.black,width: 1),
                                  shape: BoxShape.circle
                              ),
                              child:  const Icon(Icons.camera_alt,color: Colors.white,size: 15,),
                            ),
                          ))
                        ],
                      );
                    }),
                    const SizedBox(height: 40),
                    Row(
                     children: [
                       Expanded(child: CommonTextFieldWidget(title: "${AppConstants.firstName}*",msg: "Enter First Name",textEditController: Get.find<CreateProfileController>().firstName.value,font: dSansRegular,textSize:16.0)),
                       const SizedBox(width: 10,),
                       Expanded(child: CommonTextFieldWidget(title: "${AppConstants.lastName}*",msg: "Enter Last Name",textEditController: Get.find<CreateProfileController>().lastName.value,font: dSansRegular,textSize:16.0)),
                       ],
                     ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonTextFieldWidget(title: "${AppConstants.mobileNo}*",msg: "Enter Mobile Number",font: dSansRegular,textSize:16.0,textEditController: Get.find<CreateProfileController>().mobileNo.value,inputType: TextInputType.phone,),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() =>  Row(
                      children: [

                        Expanded(child: CommonDatePickWidget(title: "${AppConstants.birthdayMonth}*",hint:"Month",msg: Get.find<CreateProfileController>().month.value!="" ? Get.find<CreateProfileController>().month.value:"",font: dSansRegular,textSize:16.0,callback: (){
                          //TODO show month picker
                          ShowPicker.showTimePicker(context, DateTime.now(),false);

                        })),
                        const SizedBox(width: 10,),
                        Expanded(child: CommonDatePickWidget(title: "${AppConstants.birthdayDate}*",hint:"Date",msg: Get.find<CreateProfileController>().date.value!="" ? Get.find<CreateProfileController>().date.value:"",font: dSansRegular,textSize:16.0,callback: (){
                          //TODO show date picker
                          ShowPicker.showTimePicker(context, DateTime.now(),false);
                        })),

                      ]
                    )),

                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: AppLocalStorage().userDetail!.isLoyaltySignUp ?? false,
                      child: Wrap(
                        children: [
                          ListView.builder(physics: const NeverScrollableScrollPhysics(),shrinkWrap:true,itemBuilder: (context,index){
                            return GetBuilder<CreateProfileController>(builder: (controller){
                              return Container(
                                margin: const EdgeInsets.only(top: 5.0,bottom: 5.0,),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width:25,height: 25,child: Theme(
                                      data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.grey,
                                      ),
                                      child:Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(3)),
                                        value: controller.list[index].isAgree,
                                        onChanged: (value) {

                                          controller.list[index].isAgree=value;
                                          controller.update();
                                        },
                                      ),
                                    )),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(child: CommonTextWidget(msg:list[index],textSize: 14.0,font: dSansRegular,color: black525252,)),
                                  ],
                                ),
                              );
                            });
                          },itemCount: Get.find<CreateProfileController>().list.length)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(msg: AppConstants.done,callback: (){
                      Get.find<CreateProfileController>().onClickCreateProfile();

                    },),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              )
            )
        )
    );
  }
}
