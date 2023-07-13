


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';


class WineTastTourMap extends StatelessWidget {
  const   WineTastTourMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                   CommonToolbar(toolText: AppConstants.TastingWineTour,),
                   Padding(
                     padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 10.0,bottom: 10.0),
                     child: CommonTextWidget(msg:AppConstants.TastingWineTourDetail,textAlign: TextAlign.center,textSize: 14.0,font: dSansRegular,color: black525252,),
                   ),
                   Expanded(
                     child: InkWell(onTap:(){
                       Get.toNamed("/wineTastTourRegionList");
                     },child: Image.asset("asset/images/wine_tasting/img_map_bg.png",fit: BoxFit.fill,width: MediaQuery.of(context).size.width,)),
                   )
                ],
              ),
            )
        )
    );
  }
}