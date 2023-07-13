import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/app_database.dart';
import '../../modal/orders/order_list_model.dart';
import '../../view/order_history/history_helper.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';


class OrderHistoryController extends GetxController with GetSingleTickerProviderStateMixin{


  RxBool isPastOrders= false.obs;
  bool upcomingLoading= true;
  bool pastLoading= true;
  RxInt selectedTab=0.obs;
  List<OrdersData>? upcomingOrders;
  List<OrdersData>? pastOrders;

  void updatePastOrder(isPast){
    isPastOrders.value = isPast;
    update();
  }

  final List<Widget> myTabs = <TabBarItem>[
    TabBarItem(title: "Upcoming Orders",index:0),
    TabBarItem(title: "Past Orders",index:1),
  ];

  final List<Widget> myTabbarView = <Widget>[
    const UpcomingOrderView(),
    const PastOrderView(),
  ];

  late TabController controller;

  @override
  void onInit() {
  super.onInit();
  controller = TabController(vsync: this, length: myTabs.length);
  callOrderListApi();
  controller.addListener(() {

    if(controller.index==0){
      selectedTab.value=0;
      callOrderListApi();

      updatePastOrder(false);

    }else if(controller.index==1){
      selectedTab.value=1;
      callOrderListApi();

      updatePastOrder(true);
    }
  });
  }

  @override
  void onClose() {
  controller.dispose();
  super.onClose();
  }




  callOrderListApi(){
    callPostApi({},token:AppLocalStorage().token, selectedTab.value==0?WebServicesConstant.upcomingOrder : WebServicesConstant.pastOrder )
        .then((value) {

      if(selectedTab.value==0){
        upcomingLoading=false;
        OrderListModal modal=OrderListModal.fromJson(value);
        if(modal.response==1){
          upcomingOrders=[];
          upcomingOrders!.addAll(modal.listData!);
        }
      }else {
        pastLoading=false;
        OrderListModal modal=OrderListModal.fromJson(value);
        if(modal.response==1){
          pastOrders=[];
          pastOrders!.addAll(modal.listData!);

        }
      }
      update();
      print(value);
    });
  }
}