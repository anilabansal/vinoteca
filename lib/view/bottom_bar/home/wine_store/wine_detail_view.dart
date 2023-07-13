

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/controller/wine_store/wine_store_list_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_button_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/earn_reward_dialog.dart';
import 'package:vinoteca_app/view/bottom_bar/home/wine_store/wine_detail_helper.dart';

import 'package:vinoteca_app/view/rating_review/rating_review_helper.dart';

import '../../../../common/utils/common_colors.dart';
import '../../../../common/utils/common_font.dart';
import '../../../../controller/rating/rating_controller.dart';
import '../../../../controller/region/region_controller.dart';
import '../../../../controller/wine_store/wine_detail_controller.dart';
import '../../../app_common_widgets/bottom_sheet_common.dart';
import '../../../app_common_widgets/common_text_widget.dart';
import '../../../app_common_widgets/common_toolbar.dart';
import '../../../rating_review/rating_review.dart';


class WineDetailView extends StatelessWidget {
  const WineDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WineDetailController wineDetailController=Get.put(WineDetailController());
    final arguData = Get.arguments ;
    if(arguData!=null){
      wineDetailController.wineDetailApi(arguData[0]["wineId"]);
    }

    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<WineDetailController>(
            builder: (controller) {

              if(controller.wineData.value.wineImages!=null && controller.wineData.value.wineImages!.isNotEmpty){
                controller.wineData.value.wineImages!.reversed;
              }

              print("wineiddddd${controller.wineData.value.wineId}");
              return controller.wineData.value.wineId!=null ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CommonToolbar(toolText: AppConstants.wineDetail,color: Colors.transparent),

                  Padding(padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Stack(
                        children: [
                          RatingWineView(
                            bannerImage:controller.bannerImage.value!="" ? controller.bannerImage.value : null,
                            imageList: controller.wineData.value.wineImagesOnly,
                           ),
                          Positioned(
                              right: 15,
                              bottom: 25,
                              child: InkWell(
                                  onTap: (){

                                    controller.favLoading=true;
                                    controller.update();
                                    if(arguData["call_from"]=="wine_list"){
                                      if(Get.find<WineController>().list![Get.find<WineController>().selectedIndex.value].isLike!){
                                        controller.deleteFav(controller.wineData.value.wineId!,arguData["call_from"]);
                                      }else{
                                        controller.addFav(controller.wineData.value.wineId!,arguData["call_from"]);
                                      }
                                    }else{
                                      if(controller.wineData.value.isLike!){
                                        controller.deleteFav(controller.wineData.value.wineId!,arguData["call_from"]);
                                      }else{
                                        controller.addFav(controller.wineData.value.wineId!,arguData[1]["call_from"]);
                                      }
                                    }


                                  },
                                  child: controller.favLoading ? const LoadingButton():arguData[1]["call_from"]=="wine_list"? FavoriteButton(isLike:Get.find<WineController>().list![Get.find<WineController>().selectedIndex.value].isLike,) : FavoriteButton(isLike:controller.wineData.value.isLike,)
                              ))
                        ],
                      ),
                      Container(
                        margin:const  EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left:10,right: 10,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          color: pinkFDF3EF,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                          child: CommonTextWidget(msg:controller.wineData.value.category,font: dSansRegular,color:yellowEEB83E,textSize: 13,),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextWidget(msg:controller.wineData.value.wineName ?? "",font: dSansBold,textSize: 18.0,color: black000000,maxLine: 2,),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonRichTextWidget(maxLines:5,textSpanList:
                      [

                        TextSpan(text:controller.showDescription(), style:TextStyle(color:black525252,fontFamily: dSansRegular,fontSize:12.0) ),
                        controller.wineData.value.description!.length >100 ? TextSpan(text: controller.wineData.value.showMore!? " Read Less" :" Read More",style: TextStyle(color: Colors.black,fontFamily: dSansBold,fontSize: 12.0),recognizer: TapGestureRecognizer()..onTap = ()=> controller.onClickShowMore()) : TextSpan()]),
                       // TextSpan(text: controller.wineData.value.showMore!? " Read Less" :" Read More",style: TextStyle(color: Colors.black,fontFamily: dSansBold,fontSize: 12.0),recognizer: TapGestureRecognizer()..onTap = ()=> controller.onClickShowMore())]),

                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextWidget(msg:AppConstants.flavours,font: dSansBold,textSize: 18.0,color: black000000),
                      const SizedBox(
                        height: 10,
                      ),
                       FlavoursView(wineFlavour: controller.wineData.value.wineFlavour),

                      const SizedBox(
                        height: 20,
                      ),
                      WineRegionView(region: controller.wineData.value.region,regionId:controller.wineData.value.regionId),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextWidget(msg:AppConstants.pairing,font: dSansBold,textSize: 18.0,color: black000000),
                      const SizedBox(
                        height: 10,
                      ),
                      PairingView(winePairing: controller.wineData.value.wineFoodPair),
                      WineRatingView(commentList: controller.wineData.value.commentList!,avgRating: controller.wineData.value.avgRating,),
                      const SizedBox(height: 30)

                      ],
                    ),),

                  arguData[1]["call_from"]=="scan_wine"? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: controller.wineData.value.isRated! ? Align(
                      alignment: Alignment.bottomCenter,
                      child: CommonTextButton(msg: "Rated",callback: (){
                        Get.back();
                      },),
                    ) :CommonButton(msg: "Give Rating",callback: (){
                      RatingController controller1=Get.put(RatingController());
                      BottomSheetCommon.showSheet(RatingReviewView(wineId:controller.wineData.value.wineId,));
                    },),
                  ): WineAddToCart(wineData:controller.wineData.value)

                ],
              ) : Center(
                child: CircularProgress(),
              );
            }
          ),
        ),
      ),
    );
  }
}
