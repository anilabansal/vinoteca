
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/region/region_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_toolbar.dart';
import 'package:vinoteca_app/view/wine_tasting/region_detail_helper.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../bottom_bar/home/wine_store/wine_detail_helper.dart';

class RegionDetailView extends StatelessWidget {

  const RegionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

               const CommonToolbar(toolText: "Region Detail"),
               const SizedBox(height: 10,),
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: SingleChildScrollView(
                     child: GetBuilder<RegionController>(
                       builder: (controller) {
                         return controller.regionModal!=null ? Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             RegionImageView(image: controller.regionModal!.regionDetail!.regionImage,),
                             const SizedBox(height: 20),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children:  [
                                 ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.35),child: CommonTextWidget(msg:controller.regionModal!.regionDetail!.regionName,textSize: 18.0,font: dSansBold,color: black000000,),),
                                 RatingCustomView(rating: controller.regionModal!.regionDetail!.rating!.toString(),ratingUserCount: controller.regionModal!.regionDetail!.rating!.toString(),),

                               ],
                             ),
                             const SizedBox(height: 20,),
                             CommonTextWidget(msg: controller.regionModal!.regionDetail!.description,textSize: 14.0,font: dSansRegular,color: orange432821,maxLine: 50,),
                             const SizedBox(height: 20,),
                             CommonTextWidget(msg:"Top wines from region",textSize: 18.0,font: dSansBold,color: black000000,),
                             const SizedBox(height: 20,),
                             controller.regionModal!.wineList!.isNotEmpty ?
                             RegionsWinesList(wineList: controller.regionModal!.wineList!,) : SizedBox(child: CommonTextWidget(msg: "No top wines in this region",textSize: 14.0,font: dSansRegular,color: orange432821,maxLine: 50),)


                           ],
                         ) : CircularProgress();
                       }
                     ),
                   ),
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }

}