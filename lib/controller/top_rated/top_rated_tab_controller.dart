


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/app_database.dart';
import '../../modal/home/top_rated_wine_modal.dart';
import '../../view/bottom_bar/home/top_rated/top_rated_helper.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';



class TopRatedController extends GetxController with GetSingleTickerProviderStateMixin{


  RxBool isTopWines= false.obs;
  RxInt selectedTab=0.obs;

  bool isWineLoading = true;

  List<TopWinelist>? topWinelist;
  void updateTopWines(isPast){

    isTopWines.value = isPast;
    update();
  }

  final List<Widget> myTabs = <TabBarItem>[
    TabBarItem(title: "Wines",index:0),
    TabBarItem(title: "Regions",index:1),
  ];

  final List<Widget> myTabbarView = <Widget>[
     RatedWineList(),
     RatedRegionList(),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
    callRatedWinesRegionList();
    controller.addListener(() {
      callRatedWinesRegionList();
      if(controller.index==0){
        selectedTab.value=0;
        updateTopWines(false);

      }else{
        selectedTab.value=1;
        updateTopWines(true);
      }
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }



  callRatedWinesRegionList(){
    callPostApi({},token:AppLocalStorage().token, WebServicesConstant.topTestedRegionAndWineList )
        .then((value) {

      TopRatedWineRegion modal =TopRatedWineRegion.fromJson(value);
      if(selectedTab.value==0){
        topWinelist=[];
        topWinelist!.addAll(modal.data!.topWinelist!);
      }else {

      }
      isWineLoading=false;
      update();
      print("${topWinelist!.length}");
    });
  }
}