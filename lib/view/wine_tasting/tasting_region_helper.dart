import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/region/region_controller.dart';
import 'package:vinoteca_app/modal/home/tour_list_model.dart';
import 'package:vinoteca_app/view/app_common_widgets/bottom_sheet_common.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';
import 'package:vinoteca_app/view/rating_review/rating_review.dart';
import '../../modal/home/region_list_model.dart';
import '../app_common_widgets/common_image_widget.dart';
import '../app_common_widgets/common_toolbar.dart';


class RegionList extends StatelessWidget {
  const RegionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GetBuilder<RegionController>(
      builder: (controller) {

        return controller.isLoadingTour! ? CircularProgress() : controller.listTour!=null && controller.listTour!.isNotEmpty ? GridView.builder(
          itemCount: controller.listTour.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2 / 2.25),
          itemBuilder: (BuildContext context, int index) {
            return item(index,controller.listTour[index]);
          },
        ) :  SizedBox(child: CommonTextWidget(msg:"No Tasting wines in this region",font: dSansBold,textSize: 18),);
      }
    );
  }

  Widget  item(index,TourListItem? listData){
    return InkWell(
      onTap: (){

        Get.toNamed("/listWineAccRegionView",arguments: {"tour_id":listData!.id});

      },
      child: Container(
        margin: index! % 2 == 0
            ? const EdgeInsets.only(right: 10, bottom: 10, top: 10, left: 20)
            : const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: greyD8D8D8,width: 1),
                    borderRadius: BorderRadius.circular(10.0)
                ),
               // child: Image.asset("asset/images/dummy/img_region_yellow.png"),
                child: listData!.tourImage!=null ? CommonImageView(borderRadius: BorderRadius.circular(10.0),image: listData.tourImage,dummyImage: "asset/images/dummy/img_region_yellow.png",) : SizedBox(),
              ),
            ),
            const SizedBox(height: 8,),
            Row(
              children: [
               Expanded(child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CommonTextWidget(
                       msg: listData.tourName,
                       font: dSansBold,
                       textSize: 16.0,
                       color: black000000),
                   CommonTextWidget(
                       msg: listData.wineCount!.toString()+" wines",
                       font: dSansRegular,
                       textSize: 12.0,
                       color: black525252),
                 ],
               ),),
               const Padding(padding: EdgeInsets.only(right: 10),child:  Icon(Icons.arrow_forward_ios,color: orangeDC571F,size: 15,),)
              ],
            )
          ],
        ),
      ),
    );
  }
}


class ChooseWineRegion extends StatelessWidget {
  const ChooseWineRegion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegionController con= Get.put(RegionController());
    con.regionList();
    return   Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.only(left:10.0,right: 10),
      decoration: BoxDecoration(
          border: Border.all(color: greyD8D8D8,width: 1),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: GetBuilder<RegionController>(
        builder: (controller) {

          return controller.regionListModel!=null && controller.regionListModel!.regionNameList!.isNotEmpty ?
          CommonDropDown(selected:null,list: controller.regionListModel!.regionNameList,hint: "Select Region",onCallBack: (item){
            controller.onUpdateRegionItem(item);
          },) :
          Align(
            alignment: Alignment.centerLeft,
            child: CommonTextWidget(
                msg: "Select Region",
                font: dSansRegular,
                textSize: 16.0,
                color: black525252),
          );
        }
      ),
    );
  }


}

class WinesUnderRegionList extends StatelessWidget {
  const WinesUnderRegionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<RegionController>(
      builder: (controller) {
        return controller.isLoadingTourWines! ?  CircularProgress() : controller.tourWinesList!.isNotEmpty ? GridView.builder(
          itemCount: controller.tourWinesList!.length,
          shrinkWrap: true,
          //physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2 / 3.2),
          itemBuilder: (BuildContext context, int index) {
            return WineTourGridItem(index:index);
          },
        ) : Center(
          child:  CommonTextWidget(
            msg: "No wine found in this tour",
            font: dSansMedium,
            textSize: 16,
            color: black000000,
          )
        );
      }
    );
  }


}


class WineTourGridItem extends StatelessWidget {
  int? index;

  WineTourGridItem({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index! % 2 == 0
          ? const EdgeInsets.only(right: 10, bottom: 10, top: 10, left: 20)
          : const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  //padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration:  BoxDecoration(
                      color: pinkFDF3EF,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  // child: Image.asset(
                  //     "asset/images/wine_store/img_bottle_glass.png"),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(Get.find<RegionController>().tourWinesList![index!].wineImage!,fit: BoxFit.fill,),
                  ),
                ),
              ),

              const SizedBox(height: 2),
              CommonTextWidget(
                msg: Get.find<RegionController>().tourWinesList![index!].wineName,
                font: dSansBold,
                textSize: 18,
                color: black000000,
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  CommonTextWidget(
                    msg: "750 ML for ",
                    font: dSansRegular,
                    textSize: 14,
                    color: black525252,
                  ),
                  CommonTextWidget(
                    msg: " \$${Get.find<RegionController>().tourWinesList![index!].winePrice} ",
                    font: dSansBold,
                    textSize: 14,
                    color: orangeDC571F,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: (){
                  // showModalBottomSheet(
                  //   context: Get.context!,
                  //   isScrollControlled: true,
                  //   backgroundColor: Colors.transparent,
                  //   builder: (context) => Container(
                  //     // height: MediaQuery.of(context).size.height * 0.75,
                  //     decoration:  const BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius:  BorderRadius.only(
                  //         topLeft: Radius.circular(25.0),
                  //         topRight: Radius.circular(25.0),
                  //       ),
                  //     ),
                  //     child:  Wrap(
                  //       children: const [
                  //        RatingReviewView()
                  //       ],
                  //     ),),
                  //
                  // );

                  BottomSheetCommon.showSheet(RatingReviewView(wineId: Get.find<RegionController>().tourWinesList![index!].wineId,));
                },
                child: Container(
                  padding: const EdgeInsets.only(left:10.0,right: 10.0,bottom: 8,top: 8),
                  decoration:  BoxDecoration(
                      color: yellowEEB83E,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        msg: "Tour Guide",
                        font: dSansBold,
                        textSize: 14,
                        color: Colors.white,
                      ),
                      const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                    ],
                  ),
                ),
              )

            ],
          ),
          Visibility(
            visible: Get.find<RegionController>().tourWinesList![index!].isRated!,
            child: Container(
              color: Colors.white.withOpacity(0.5),
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.only(left:10.0,right: 10.0,bottom: 8,top: 8),
                decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("asset/images/wine_tasting/img_rate_done.png",width: 22,height: 22,),
                    const SizedBox(width: 8,),
                    CommonTextWidget(
                      msg: "Rating Done",
                      font: dSansBold,
                      textSize: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}