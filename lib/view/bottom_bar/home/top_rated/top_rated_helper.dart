



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/top_rated/top_rated_tab_controller.dart';
import 'package:vinoteca_app/view/bottom_bar/home/wine_store/wine_detail_view.dart';
import 'package:vinoteca_app/view/wine_tasting/region_detail.dart';

import '../../../../common/utils/common_colors.dart';
import '../../../../common/utils/common_font.dart';
import '../../../app_common_widgets/common_all_widget.dart';
import '../../../app_common_widgets/common_text_widget.dart';
import '../wine_store/wine_detail_helper.dart';

class RatedWineList extends StatelessWidget {

  RatedWineList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopRatedController>(
        builder: (controller) {
          return controller.isWineLoading ? CircularProgress() :  controller.topWinelist!.length>0 ? ListView.builder(itemBuilder: (context,index){
            return  wineItem(index);
          },itemCount: controller.topWinelist!.length) : Center(child: CommonTextWidget(msg:"No wines are rated yet",font: dSansMedium,textSize: 16,color: black525252,),);
        }
    );
  }

  Widget wineItem(index){
    return InkWell(
      onTap: (){
        Get.to(WineDetailView());
      },
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment:Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Container(

                      decoration: const BoxDecoration(
                          color: pinkFDF3EF,
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),),
                  ),
                ),
                Image.asset("asset/images/wine_store/img_bottle_glass.png",)
              ],
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(msg:Get.find<TopRatedController>().topWinelist![index].wineName,font: dSansBold,textSize: 18,color: black000000,),
              const SizedBox(height: 10),
              Row(
                  children: [
                    CommonTextWidget(msg:"750 ML for ",font: dSansRegular,textSize: 14,color: black525252,),
                    CommonTextWidget(msg:" \$${Get.find<TopRatedController>().topWinelist![index].price} ",font: dSansBold,textSize: 14,color: orangeDC571F,),
                  ]),
              const SizedBox(height: 10),

              RatingCustomView(ratingUserCount: "54",rating: "4",)
            ],
          )),
          const SizedBox(width: 10,),
          const Icon(Icons.arrow_forward_ios,color: black525252,size: 15,)

        ],
      ),
    );
  }


}



class RatedRegionList extends StatelessWidget {

  RatedRegionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<TopRatedController>(
      builder: (controller) {
        return controller.topWinelist!.length>0 ? ListView.builder(itemBuilder: (context,index){
          return  regionItem(index);
        },itemCount: controller.topWinelist!.length) : Center(child: CommonTextWidget(msg:"No rated region find",font: dSansMedium,textSize: 16,color: black525252,));
      }
    );
  }


  Widget regionItem(index){
    return InkWell(
      onTap: (){
        Get.to(RegionDetailView());
      },
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment:Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Container(

                      decoration: const BoxDecoration(
                          color: pinkFDF3EF,
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),),
                  ),
                ),
                Image.asset("asset/images/wine_store/img_map.png",width: 40,height: 40,)
              ],
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(msg:Get.find<TopRatedController>().topWinelist![index].wineName,font: dSansBold,textSize: 18,color: black000000,),
              const SizedBox(height: 10),
              CommonTextWidget(msg:Get.find<TopRatedController>().topWinelist![index].description,font: dSansRegular,textSize: 14,color: black525252,),
              const SizedBox(height: 10),
              const RatingCustomView(ratingUserCount: "54",rating: "4",)
            ],
          )),
          const SizedBox(width: 10,),
          const Icon(Icons.arrow_forward_ios,color: black525252,size: 15,)

        ],
      ),
    );
  }

}



class TabBarItem extends StatelessWidget {
  int? index;
  String? title;
  TabBarItem({Key? key,this.title,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonTextWidget(msg:title,textSize: 16.0,font: dSansBold,color:  Get.find<TopRatedController>().selectedTab.value==index ? orangeDC571F : black525252),
          const SizedBox(height: 10,),
          Row(
            mainAxisSize:MainAxisSize.min,children: [
            Container(width: 40,height: 2,color: Get.find<TopRatedController>().selectedTab.value==index ? orangeDC571F : black525252),
            const SizedBox(width: 5,),
            Container(width: 6,height: 2,color:Get.find<TopRatedController>().selectedTab.value==index ? orangeDC571F : black525252),
            const SizedBox(width: 5,),
            Container(width: 2,height: 2,color: Get.find<TopRatedController>().selectedTab.value==index ? orangeDC571F : black525252)
          ],)
        ],
      ),
    ));
  }
}