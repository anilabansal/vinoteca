import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/order_history/order_history_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/bottom_sheet_common.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../modal/orders/order_list_model.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../rating_review/rating_review.dart';

class UpcomingOrderView extends StatelessWidget {
  const UpcomingOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshLocalGallery,
      child: SingleChildScrollView(
        child: GetBuilder<OrderHistoryController>(
            builder: (controller) {
              return controller.upcomingLoading ? Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.7,
                  child: Center(
                    child:  CircularProgress(),
                  ),
                ),
              ) : controller.upcomingOrders!.isNotEmpty? ListView.builder(
                itemBuilder: (context, index) {
                  return  HistoryOrderListItem(ordersData: controller.upcomingOrders![index],);
                },
                itemCount: controller.upcomingOrders!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ):SizedBox(
                height:MediaQuery.of(context).size.height*0.7,
                child: Center(
                  child:CommonTextWidget(
                    msg: "No Upcoming Orders Found",
                    font: dSansBold,
                    textSize: 18,
                    color: black000000,
                  )

                ),
              );
            }
        ),
      ),
    );
  }

  Future<dynamic> _refreshLocalGallery() async{
    print('refreshing stocks...');
    Get.find<OrderHistoryController>().callOrderListApi();

  }
}

class PastOrderView extends StatelessWidget {
  const PastOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshLocalGallery,
      child: SingleChildScrollView(
        child: GetBuilder<OrderHistoryController>(
            builder: (controller) {
              return controller.pastLoading ? Expanded(
                child:  SizedBox(
                  height: MediaQuery.of(context).size.height*0.7,
                  child: Center(
                    child:  CircularProgress(),
                  ),
                ),
              )  : controller.pastOrders!.isNotEmpty? ListView.builder(
                itemBuilder: (context, index) {
                  return  HistoryOrderListItem(ordersData: controller.pastOrders![index],);
                },
                itemCount: controller.pastOrders!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ): SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                child: Center(
                  child:CommonTextWidget(
                    msg: "No Past Orders Found",
                    font: dSansBold,
                    textSize: 18,
                    color: black000000,
                  )
                ),
              );
            }
        ),
      ),
    );
  }

  Future<dynamic> _refreshLocalGallery() async{
    print('refreshing stocks...');
    Get.find<OrderHistoryController>().callOrderListApi();

  }
}

class HistoryOrderListItem extends StatelessWidget {
  final OrdersData? ordersData;
  const HistoryOrderListItem({Key? key,this.ordersData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Get.toNamed("/orderDetail",arguments: [{"orderId":ordersData!.orderId},{"status":ordersData!.orderStatus!}]);
      },
      child: Padding(
        padding:
        const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Stack(
                  children: [
                    ClipRect(
                      child: Image.asset(
                        "asset/images/dummy/img_pair1.png",
                        fit: BoxFit.fill,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    "asset/images/order_history/img_delivery_white.svg"),
                                const SizedBox(
                                  width: 8,
                                ),
                                CommonTextWidget(
                                  msg: ordersData!.orderStatus,
                                  textSize: 12.0,
                                  font: dSansMedium,
                                  color: Colors.white,
                                ),
                              ])),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        msg: "#${ordersData!.orderId.toString()}",
                        textSize: 15.0,
                        font: dSansRegular,
                        color: black525252,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: orangeDC571F,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CommonTextWidget(
                            msg: ordersData!.orderedOn!.split("T")[0],
                            textSize: 13.0,
                            font: dSansRegular,
                            color: black525252,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 1,
                        color: greyD8D8D8,
                      ),
                      const SizedBox(height: 5),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget(
                            msg: "Total  Price",
                            font: dSansBold,
                            textSize: 14,
                            color: black525252,
                          ),
                          CommonTextWidget(
                            msg: " \$${ordersData!.orderAmount} ",
                            font: dSansBold,
                            textSize: 14,
                            color: orangeDC571F,
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  int? index;
  String? title;

  TabBarItem({Key? key, this.title, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(
                msg: title,
                textSize: 16.0,
                font: dSansBold,
                color: Get.find<OrderHistoryController>().selectedTab.value ==
                        index
                    ? orangeDC571F
                    : black525252),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    width: 40,
                    height: 2,
                    color:
                        Get.find<OrderHistoryController>().selectedTab.value ==
                                index
                            ? orangeDC571F
                            : black525252),
                const SizedBox(
                  width: 5,
                ),
                Container(
                    width: 6,
                    height: 2,
                    color:
                        Get.find<OrderHistoryController>().selectedTab.value ==
                                index
                            ? orangeDC571F
                            : black525252),
                const SizedBox(
                  width: 5,
                ),
                Container(
                    width: 2,
                    height: 2,
                    color:
                        Get.find<OrderHistoryController>().selectedTab.value ==
                                index
                            ? orangeDC571F
                            : black525252)
              ],
            )
          ],
        ));
  }
}
