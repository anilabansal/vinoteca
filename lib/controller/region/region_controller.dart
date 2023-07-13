

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/common/common_modal.dart';
import 'package:vinoteca_app/modal/home/tour_list_model.dart';
import 'package:vinoteca_app/view/app_common_widgets/bottom_sheet_common.dart';

import '../../modal/home/all_wines_list_modal.dart';
import '../../modal/home/region_detail_modal.dart';
import '../../modal/home/region_list_model.dart';
import '../../modal/home/tour_detail_modal.dart';
import '../../view/store/store_detail_view.dart';
import '../store/store_detail_controller.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class RegionController extends GetxController{

  RegionData? regionModal;
  RegionListModel? regionListModel;
  bool? isLoadingTour=true;
  bool? isLoadingTourWines=true;
  String selectedRegionName="";
  List<TourListItem> listTour=[];
  List<TourWines>? tourWinesList=[];


  void regionDetail(id){

    callPostApi({"regionId":id
    }, token:AppLocalStorage().token,WebServicesConstant.regionDetail)
        .then((value) {
      RegionModal modal=RegionModal.fromJson(value);
      regionModal=modal.data;
      update();
    });
  }




  void regionList(){


    callPostApi({
    }, token:AppLocalStorage().token,WebServicesConstant.regionList)
        .then((value) {
      regionListModel=RegionListModel.fromJson(value);
       //if(regionListModel!.regionNameList!.isNotEmpty){
        // selectedRegionName=regionListModel!.regionNameList![0];
        //  if(regionListModel!.listData!.isNotEmpty){
        //   tourList(regionListModel!.listData![0].regionId);
        //  }
       //}
      isLoadingTour=false;
      update();
    });
  }



  void tourList(id){

    callPostApi({"RegionId":id
    }, token:AppLocalStorage().token,WebServicesConstant.tourList)
        .then((value) {
      TourListModal model=TourListModal.fromJson(value);
      listTour.clear();
      if(model.response==1){
        listTour.addAll(model.data!);
      }
      isLoadingTour=false;
       update();
    });
  }



  void tourDetail(id){

    callPostApi({"TourId":id
    }, token:AppLocalStorage().token,WebServicesConstant.tourWineList)
        .then((value) {
      isLoadingTourWines=false;
      tourWinesList!.clear();
      TourDetailModal modal =TourDetailModal.fromJson(value);
      if(modal.response==1) {
        tourWinesList!.addAll(modal.listData!);
      }

      update();
    });
  }


  onUpdateRegionItem(String item){
    isLoadingTour=true;
    selectedRegionName=item;

    Iterable itemData=regionListModel!.listData!.where((element) => element.regionName==item);
    if(itemData.isNotEmpty){
      ListData mData=itemData.first;
      tourList(mData.regionId);
    }

    update();
  }






}