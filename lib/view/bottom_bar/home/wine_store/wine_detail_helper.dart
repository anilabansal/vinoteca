

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/region/region_controller.dart';
import 'package:vinoteca_app/controller/wine_store/wine_detail_controller.dart';
import 'package:vinoteca_app/controller/wine_store/wine_store_list_controller.dart';
import 'package:vinoteca_app/modal/home/all_wines_list_modal.dart';
import 'package:vinoteca_app/view/store/store_detail_view.dart';
import 'package:vinoteca_app/view/wine_tasting/region_detail.dart';

import '../../../../common/utils/common_colors.dart';
import '../../../../common/utils/common_font.dart';
import '../../../../controller/store/store_detail_controller.dart';
import '../../../app_common_widgets/bottom_sheet_common.dart';
import '../../../app_common_widgets/common_all_widget.dart';
import '../../../app_common_widgets/common_button_widget.dart';
import '../../../app_common_widgets/common_text_widget.dart';


class PairingView extends StatelessWidget {

  List<WinePairing>? winePairing;
  PairingView({Key? key,this.winePairing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        winePairing!=null && winePairing!.isNotEmpty ? GridView.builder(
          itemCount: winePairing!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 4 / 2),
          itemBuilder: (BuildContext context, int index) {
            return gridItem(index);
          },
        ): CommonTextWidget(
            msg: "No Pairing Found",
            font: dSansRegular,
            textSize: 12.0,
            color: black525252)
      ],
    );
  }

  Widget gridItem(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRect(
          // child: Image(image:NetworkImage(
          //   winePairing![index].foodImage!,
          //
          // ),width: 70,
          //   height: 70,),
          child:  ImageViewCommon(imageWidth:70,imageHeight:70,image: winePairing![index].foodImage!,),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: CommonTextWidget(
                msg: winePairing![index].foodName,
                font: dSansRegular,
                textSize: 14.0,
                color: black525252),
          ),
        )
      ],
    );
  }
}

class StoreFeatureView extends StatelessWidget {
  const StoreFeatureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<StoreController>(
      builder: (controller) {
        return controller.storeDetailModal!=null ? Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: greyE9E9E9, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // Image.asset(
                //   "asset/images/dummy/img_pair1.png",
                //   width: 70,
                //   height: 70,
                // ),

                ClipRRect(borderRadius:BorderRadius.circular(10.0),child: Image.network(controller.storeDetailModal!.data!.storeImage!,width: 70,height: 70,fit: BoxFit.fill,)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0,bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: CommonTextWidget(
                                  msg: controller.storeDetailModal!.data!.storeName,
                                  font: dSansBold,
                                  textSize: 16.0,
                                  color: black000000),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10,top: 3),
                              child: Row(
                                children: [
                                  Icon(Icons.alarm_sharp,color: orangeDC571F,size: 15,),
                                  CommonTextWidget(
                                      msg: "Opening hour:",
                                      font: dSansRegular,
                                      textSize: 10.0,
                                      color: orangeDC571F),
                                  CommonTextWidget(
                                      msg:"",
                                      //msg: controller.storeDetailModal!.data!.openingHours,
                                      font: dSansRegular,
                                      textSize: 10.0,
                                      color: black525252)
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_sharp,
                                  color: orangeDC571F,
                                  size: 12.0,
                                ),
                                CommonTextWidget(
                                    msg: controller.storeDetailModal!.data!.location,
                                    color: black525252,
                                    font: dSansRegular,
                                    textSize: 12.0)
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                Get.find<StoreController>().updateWinesVisibility(true);
                                BottomSheetCommon.showSheet(StoreDetailView());
                              },
                              child: Container(
                                padding:const  EdgeInsets.only(left:10.0,right: 10.0,top: 8.0,bottom: 8.0),
                                decoration: const BoxDecoration(
                                    color: orangeFFEFE5,
                                    borderRadius: BorderRadius.all(Radius.circular(6))
                                ),
                                child: SvgPicture.asset("asset/images/wine_store/img_arrow_right_orange.svg"),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ) : SizedBox();
      }
    );
  }
}

class WineRegionView extends StatelessWidget {

  WineRegionView({Key? key,this.region,this.regionId}) : super(key: key);

  String? region;
  int? regionId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<RegionController>().regionDetail(regionId!);
     //   Get.toNamed("/regionDetailView");
        Get.to(()=> RegionDetailView());
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(color: pinkFDF3EF, width: 5),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "asset/images/wine_store/img_map_region_orange.svg",
              width: 20,
              height: 20,
            ),
            CommonRichTextWidget(textSpanList:
            [
              const TextSpan(text: "Region :-", style:TextStyle(color:black000000,fontFamily: dSansBold,fontSize:14.0) ),
              TextSpan(text: " ${region}" ?? "",style: TextStyle(color: black525252,fontFamily: dSansRegular,fontSize: 14.0))])
          ],
        ),
      ),
    );
  }
}

class WineRatingView extends StatelessWidget {
  final List<CommentList>? commentList;
  final double? avgRating;
  const WineRatingView({Key? key,this.commentList,this.avgRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [

            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CommonTextWidget(msg:"Average rating",font: dSansBold,textSize: 18.0,color: black000000),
              const SizedBox(height: 5,),
              RatingCustomView(rating:" ${avgRating!.toString()}",ratingUserCount: "${commentList!.length}")
            ]),
            ),
            CommonRichTextWidget(textSpanList:
            [
              TextSpan(text: "${avgRating!.toString()}", style:TextStyle(color:orange432821,fontFamily: dSansBold,fontSize:38.0) ),
              TextSpan(text: " Star",style: TextStyle(color: orange432821,fontFamily: dSansMedium,fontSize: 15.0))])
          ],
        ),
        const SizedBox(height: 20,),
        commentList!.isNotEmpty? Wrap(
         children: [
           ListView.builder(itemBuilder: (context,index){return ratingListItem(commentList![index]);},itemCount: commentList!.length,shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),)
         ],
       ):SizedBox()

      ],
    );
  }


  Widget ratingListItem(CommentList listData){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1,
          width: double.infinity,
          color: greyD8D8D8,
          margin: const EdgeInsets.only(left:5,right: 5,bottom: 10,top: 10),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                "asset/images/dummy/img_pair1.png",
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(msg:listData.userName,font: dSansBold,textSize: 18.0,color: black000000),
                      RatingCustomView(rating:" ${listData.rating!.toString()}",ratingUserCount: "")
                    ],
                  ),
                  CommonTextWidget(msg:listData.email,font: dSansRegular,textSize: 13.0,color: black525252),
                  const SizedBox(height: 10.0,),
                  CommonTextWidget(msg:listData.comment,font: dSansMedium,textSize: 15.0,color: black525252),
                ],
              ),
            )
          ],
        ),


      ],
    );

  }
}



class RatingCustomView extends StatelessWidget {
  final String? ratingUserCount;
  final String? rating;
  final double? size;
  final Color? color;
  const RatingCustomView({Key? key,this.rating,this.ratingUserCount,this.size,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        RatingBar(
          initialRating: rating!=null ? double.parse(rating!):3.0 ,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ignoreGestures: true,
          itemSize: size ?? 15,
          ratingWidget: RatingWidget(
            full: SvgPicture.asset('asset/images/rating/img_full_star_yellow.svg'),
            half: SvgPicture.asset('asset/images/rating/img_half_star_yellow.svg',),
            empty: SvgPicture.asset('asset/images/rating/img_border_star_yellow.svg',),
          ),
          itemPadding: const EdgeInsets.only(right: 8),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        CommonTextWidget(msg:ratingUserCount!="" && rating!="0.0" ? "$rating($ratingUserCount)" :"0",font: dSansBold,textSize: 13.0,color: black525252),
      ],
    );
  }}



class FlavoursView extends StatelessWidget {
  List<WineFlavour>? wineFlavour;
   FlavoursView({Key? key,this.wineFlavour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        wineFlavour!=null && wineFlavour!.isNotEmpty ?
        ListView.builder(
          itemCount: wineFlavour!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return flavourCommon(index);
          },
        ): CommonTextWidget(
            msg: "No Flavour Found",
            font: dSansRegular,
            textSize: 12.0,
            color: black525252)
      ],
    );
  }


 Widget flavourCommon(index){
    return Row(
      children: [
        ImageViewCommon(imageWidth:30,imageHeight:30,image: wineFlavour![index].flavourIcon!),
        const SizedBox(width: 10,),
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: black525252
              ),
            ),
            const SizedBox(width: 10,),
            CommonTextWidget(
                msg: wineFlavour![index].flavourName,
                font: dSansRegular,
                textSize: 12.0,
                color: black525252)
          ],
        ),
      ],
    );
 }
}



class WineAddToCart extends StatelessWidget {

  WineData? wineData;
   WineAddToCart({Key? key,this.wineData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        children: [
          // CartItemAddSub(width: 40,height: 40,backgroundColor: pinkFDF3EF,activeColor: Colors.white,unactiveColor: pinkFDF3EF,borderColor: orangeDC571F,wineData:Get.find<WineController>().list![Get.find<WineController>().selectedIndex.value]),
          // const SizedBox(width: 20),
          // Expanded(child:  CommonButton(msg:"Add Wine- \$${Get.find<WineController>().list![Get.find<WineController>().selectedIndex.value].price!.toString()}",callback: (){
          //   Get.find<WineDetailController>().onClickAddWine();
          // },))


          CartItemAddSub(width: 40,height: 40,backgroundColor: pinkFDF3EF,activeColor: Colors.white,unactiveColor: pinkFDF3EF,borderColor: orangeDC571F,wineData:wineData),
          const SizedBox(width: 20),
          Expanded(child:  CommonButton(msg:"Add Wine- \$${wineData!.price}",callback: (){
            Get.find<WineDetailController>().onClickAddWine();
          },))
        ],
      ),
    );
  }

}