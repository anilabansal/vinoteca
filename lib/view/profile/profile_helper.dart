


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';

import '../../database/app_database.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_image_widget.dart';
import 'dotted_border.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: (){
              if(AppLocalStorage().isProfileCreated){
                Get.toNamed("/editProfileView");
              }else{
                Get.offNamed("/createProfile");
              }

            },
            child: Container(
              margin: const EdgeInsets.all(20),
              child: SvgPicture.asset("asset/images/profile/img_editing_profile.svg"),
            ),
          ),
        ),
        profileImage
      ],
    );
  }

  Widget get profileImage {

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: DottedBorder(
        dashPattern: const [35,16],
        strokeWidth: 4,
        color: orangeDC571F,
        borderType: BorderType.Circle,
        padding: const EdgeInsets.all(8),
        borderPadding: const EdgeInsets.all(4),
        child: GetBuilder<AppLocalStorage>(
          builder: (controller){
            return CircularImageView(imageHeight: 110,imageWidth: 110,image: Get.find<AppLocalStorage>().isProfileCreated ? Get.find<AppLocalStorage>().userDetail!.profilePic:"");
          },
        ),
      )
    );
  }
}


class UserDetail extends StatelessWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLocalStorage>(
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                const ProfileImage(),

                CommonTextWidget(msg:controller.isProfileCreated ? "${controller.userDetail!.firstName!} ${controller.userDetail!.lastName!}" : "",font: dSansBold,textSize: 18.0,color: black000000,),

                Visibility(visible:AppLocalStorage().userDetail!.isLoyaltySignUp ?? false,child: rewardUser(controller.userDetail!.totalRewardPoints.toString()))

              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: details(controller.userDetail!.phoneNumber!),
            ),

          ],
        );
      }
    );
  }


  Widget  rewardUser(points){
    return InkWell(
      onTap: (){
        Get.toNamed("/myRewards");
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left:10,right: 10,top: 6,bottom: 6),
            margin:const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(color: yellowEEB83E,width: 1)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("asset/images/cart/img_diamond.svg",width: 20,height: 20,),
                const SizedBox(width: 10,),
                CommonTextWidget(msg: points,font: dSansMedium,textSize: 14.0,color: yellowEEB83E,)
              ],
            ),
          ),
        Positioned(
          right: 0,
          child: Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: yellowEEB83E

          ),
          child: const Icon(Icons.arrow_forward_ios_sharp,size: 8,color: Colors.white,),
        ),)
        ],
      ),
    );
  }


  Widget  details(String mobile){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          border: Border.all(color: greyD8D8D8,width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonWidget("asset/images/profile/img_mobile.png","Contact Number",Get.find<AppLocalStorage>().isProfileCreated ? Get.find<AppLocalStorage>().userDetail!.phoneNumber : "",1),
          Container(
            height: 1,
            color: greyD8D8D8,
            margin: const EdgeInsets.only(top: 15.0,bottom: 15.0),
          ),
          commonWidget("asset/images/profile/img_flag.png","Country","USA",2),
          Container(
            height: 1,
            color: greyD8D8D8,
            margin: const EdgeInsets.only(top: 15.0,bottom: 15.0),
          ),
          commonWidget("asset/images/profile/img_likes.png","All Reviews","Total (${Get.find<AppLocalStorage>().userDetail!.reviewCount} reviews)",3),
        ],
      ),
    );
  }


  Widget  commonWidget(image,title,desc,index){
    return InkWell(
      onTap: (){
        if(index==3){
          Get.find<ProfileController>().getAllReviewList();
          Get.toNamed("/allReview");
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left:10.0,right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image,width: 35,height: 35,),
            const SizedBox(width: 20.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(msg: title,font: dSansBold,textSize: 18.0,color: black000000),
                  const SizedBox(height: 5,),
                  CommonTextWidget(msg: desc,font: dSansRegular,textSize: 16.0,color: black525252),
                ],
              ),
            ),
            index==3? const Icon(Icons.arrow_forward_ios_sharp,size: 20,color: orangeDC571F,): const SizedBox()
          ],
        ),
      ),
    );
  }
}
