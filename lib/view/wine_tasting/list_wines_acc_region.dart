
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/region/region_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';
import 'package:vinoteca_app/view/wine_tasting/tasting_region_helper.dart';
import '../../controller/rating/rating_controller.dart';
import '../app_common_widgets/common_toolbar.dart';


class ListWineAccRegionView extends StatelessWidget {
  const ListWineAccRegionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    RatingController controller = Get.put(RatingController());
    if(Get.arguments!=null)
   {
     var tourId=Get.arguments["tour_id"];
     Get.find<RegionController>().tourDetail(tourId);
   }
    return   Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CommonToolbar(toolText: AppConstants.WineTour,),

                  const Expanded(
                      child: WinesUnderRegionList()
                  )
                ],
              ),
            )
        )
    );
  }
}






