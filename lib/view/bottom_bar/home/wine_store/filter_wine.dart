

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/store/filter_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_button_widget.dart';

import '../../../../common/utils/common_colors.dart';
import '../../../../common/utils/common_font.dart';
import '../../../app_common_widgets/common_text_widget.dart';
import '../../../app_common_widgets/common_toolbar.dart';

//Taste, Rating, White/ red wine ( category ) , region , favourite wines
class FilterWineView extends StatelessWidget {
  const FilterWineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterController controll=Get.put(FilterController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonToolbar(toolText: "Filter"),

              SingleChildScrollView(
                child: GetBuilder<FilterController>(
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          CommonTextWidget(msg:"Wine Type",textSize: 19.0,color: black000000,font: dSansBold,),
                          const SizedBox(height: 10,),

                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(left:10.0,right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: greyD8D8D8,width: 1),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: CommonDropDown(selected:controller.selectedWine,list:  controller.wineType,hint: "Choose Type",onCallBack: (item){
                              controller.updateWineType(item);
                            }),
                          ),
                          const SizedBox(height: 20,),
                          CommonTextWidget(msg:"Region",textSize: 19.0,color: black000000,font: dSansBold,),
                          const SizedBox(height: 10,),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(left:10.0,right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: greyD8D8D8,width: 1),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: controller.selectedRegionName!="" ? CommonDropDown(selected:controller.selectedRegionName,list: controller.regionListModel!.regionNameList,hint: "Choose Region",onCallBack: (item){
                              controller.onUpdateRegionItem(item);
                            }) :SizedBox(width: MediaQuery.of(context).size.width,),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextWidget(msg:"Rating",textSize: 19.0,color: black000000,font: dSansBold,),
                          const SizedBox(height: 10,),
                          RatingBar(
                            initialRating: controller.rating!,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: Padding(padding: const EdgeInsets.all(5),child:SvgPicture.asset('asset/images/rating/img_full_star_yellow.svg')),
                              half: Padding(padding: const EdgeInsets.all(5),child:SvgPicture.asset('asset/images/rating/img_border_star_yellow.svg')),
                              empty: Padding(padding: const EdgeInsets.all(5),child:SvgPicture.asset('asset/images/rating/img_border_star_yellow.svg')),
                            ),
                            itemPadding: EdgeInsets.zero,
                            onRatingUpdate: (rating) {
                              print(rating);
                              controller.updateRating(rating);
                            },
                          ),

                          // const SizedBox(height: 20,),
                          // CommonTextWidget(msg:"Taste",textSize: 19.0,color: black000000,font: dSansBold,),
                          // const SizedBox(height: 10,),
                          // Container(
                          //   height: 50,
                          //   padding: const EdgeInsets.only(left:10.0,right: 10),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: greyD8D8D8,width: 1),
                          //       borderRadius: BorderRadius.circular(10.0)
                          //   ),
                          //   child: CommonDropDown(selected:"",list: [],hint: "Choose Taste",onCallBack: (item){}),
                          // ),


                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextWidget(msg:"Favorite",textSize: 19.0,color: black000000,font: dSansBold,),
                              const SizedBox(width: 10,),
                              Switch(value: controller.isFavorite,activeColor:orangeDC571F, onChanged: (v){
                                controller.updateIsFavorite(v);
                              })
                            ]
                          ),
                          const SizedBox(height: 50),
                          Align(
                           alignment: Alignment.bottomCenter,
                           child:  CommonButton(
                               msg: "Done",
                               callback: () {

                                 controller.wineFilter();

                               }),
                         ),
                        ]
                      ),


                    );
                  }
                ),
              )

            ],
          ),
        )
      )
    );
  }
}
