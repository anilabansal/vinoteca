

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_text_widget.dart';

class RewardsTopView extends StatelessWidget {
  const RewardsTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller=Get.put(ProfileController());
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.3,
      color: yellowEEB83E,
      child: Stack(
        children: [
          Image.asset("asset/images/profile/img_reward_bg.png",fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Align(
                   alignment: Alignment.topLeft,
                   child: InkWell(
                     onTap: (){
                       Get.back();
                     },
                     child:  Icon(Icons.arrow_back_ios,color: Colors.white,size: 25,),
                   ),
                 ),

                  Container(
                    height: 60,
                    width: 60,
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset("asset/images/cart/img_diamond.svg",width: 20,height: 20,),
                    ),
                  ),

                  CommonTextWidget(msg: "Total Reward Point",font: dSansRegular,textSize: 17.0,color: Colors.white,),

                  CommonTextWidget(msg: "${controller.rewardPointstotal.toString()}",font: dSansBold,textSize: 22.0,color: Colors.white,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}



class RewardsBottomView extends StatelessWidget {
  const RewardsBottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // ProfileController controller=Get.put(ProfileController());
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return ListView.builder(itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.only(left:20,right: 20,bottom: 20),
            decoration: BoxDecoration(

                borderRadius:const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: yellowEEB83E,width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SvgPicture.asset("asset/images/profile/img_rewards_like.svg"),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child:  Row(
                                children: [
                                  CommonTextWidget(
                                      msg: "${controller.rewardList![index].points}",
                                      font: dSansBold,
                                      textSize: 17.0,
                                      color: orangeDC571F),
                                  CommonTextWidget(
                                      msg: " Reward Earned  ",
                                      font: dSansBold,
                                      textSize: 17.0,
                                      color: black000000)
                                ],
                              ),
                            ),
                            CommonTextWidget(
                                msg: "12 hours ago",
                                font: dSansRegular,
                                textSize: 12.0,
                                color: black525252),

                          ],
                        ),

                        CommonTextWidget(msg: "Congrats you have earned ${controller.rewardList![index].points} reward for ${controller.rewardList![index].type}  ",font: dSansRegular,textSize: 12.0,color: black525252)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
          },itemCount: controller.rewardList!.length);
      }
    );
  }



}