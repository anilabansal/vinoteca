




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/view/bottom_bar/home/top_rated/top_rated_helper.dart';

import '../../../../common/utils/common_strings.dart';
import '../../../../controller/order_history/order_history_controller.dart';
import '../../../../controller/top_rated/top_rated_tab_controller.dart';
import '../../../app_common_widgets/common_toolbar.dart';
import '../../../cart/cart_helper.dart';


class TopRatedWineRegion extends StatelessWidget {
  const TopRatedWineRegion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CommonToolbar(toolText: AppConstants.TopRatedWineRegions,color: Colors.transparent,),
            const SizedBox(height: 10.0,),
            TabBar(tabs: Get.find<TopRatedController>().myTabs,
              controller: Get.find<TopRatedController>().controller,indicatorColor: Colors.transparent ,),
            const SizedBox(height: 20.0,),
            Expanded(child: TabBarView(children: Get.find<TopRatedController>().myTabbarView,controller: Get.find<TopRatedController>().controller,))

          ],
        ),
      ),
    );
  }
}
