


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/order_history/order_history_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import 'history_helper.dart';

class OrderHistoryView extends StatelessWidget {
  
  OrderHistoryView({Key? key,t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 10,),
            CommonTextWidget(msg:"Orders",font: dSansBold,textSize: 22.0,color: black000000),
            const SizedBox(height: 30.0,),
            TabBar(tabs: Get.find<OrderHistoryController>().myTabs,
              controller: Get.find<OrderHistoryController>().controller,indicatorColor: Colors.transparent ,),
            const SizedBox(height: 20.0,),
            Expanded(child: TabBarView(controller: Get.find<OrderHistoryController>().controller,children: Get.find<OrderHistoryController>().myTabbarView))

          ],
        ),
      ),
    );
  }


}

