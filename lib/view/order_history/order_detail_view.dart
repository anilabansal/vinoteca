

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/order_history/order_detail_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';

import '../../../common/utils/common_colors.dart';
import '../../../common/utils/common_font.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';

import 'order_detail_helper.dart';


class OrderDetailView extends StatelessWidget {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderDetailController con=Get.put(OrderDetailController());
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CommonToolbar(toolText: AppConstants.orderDetail,color: Colors.transparent,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GetBuilder<OrderDetailController>(
                  builder: (controller) {
                    return controller.isLoading.value ? Center(
                      child: CircularProgress() ,
                    ):Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget(msg:"#${controller.modal!.data!.orderData!.orderId!.toString()}",textSize: 15.0,font: dSansRegular,color: black525252,),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today,color: orangeDC571F,size: 16,),
                                const SizedBox(width: 8,),
                                CommonTextWidget(msg:controller.modal!.data!.orderData!.orderOn!.split("T")[0].toString(),textSize: 15.0,font: dSansRegular,color: black525252,),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonTextWidget(msg:"Ordered Wines",font: dSansBold,textSize: 18.0,color: black525252),
                        const SizedBox(
                          height: 20,
                        ),
                        OrderedWine(),
                        const SizedBox(
                          height: 20,
                        ),
                        const OrderSummary(),
                        const SizedBox(
                          height: 20,
                        ),
                         DeliveryButton(msg:Get.arguments[1]["status"])

                      ],
                    );
                  }
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
