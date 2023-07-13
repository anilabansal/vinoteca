

import 'package:get/get.dart';
import 'package:vinoteca_app/controller/wine_store/wine_store_list_controller.dart';
import 'package:vinoteca_app/modal/home/all_wines_list_modal.dart';
import 'package:vinoteca_app/view/app_common_widgets/snackbar.dart';
import '../../database/app_database.dart';
import '../../modal/home/filter_model.dart';
import '../../modal/home/region_detail_modal.dart';
import '../../modal/home/region_list_model.dart';
import '../../modal/home/store_detail_modal.dart';
import '../../modal/home/store_list_modal.dart';
import '../../view/app_common_widgets/bottom_sheet_common.dart';
import '../../view/store/store_detail_view.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class FilterController extends GetxController {

  List<String> wineType = ["Red","White","Rose","Sparkling","Dessert"];
  String selectedWine="";


  RegionData? regionModal;
  RegionListModel? regionListModel;
  bool? isLoadingTour=true;
  bool isFavorite=false;
  String selectedRegionName="";
  double? rating=3.0;
  int? selectRegionId=0;

  @override
  void onInit() {
    super.onInit();
    selectedWine=wineType[0];
    regionList();
  }

  updateRating(rateItem){
    rating=rateItem;
    update();
  }

  updateWineType(type){
    selectedWine=type;
    update();
  }

  void regionList(){

    callPostApi({
    }, token:AppLocalStorage().token,WebServicesConstant.regionList)
        .then((value) {
      isLoadingTour=false;
      regionListModel=RegionListModel.fromJson(value);
      if(regionListModel!.regionNameList!.isNotEmpty){
        selectedRegionName=regionListModel!.regionNameList![0];
        selectRegionId=regionListModel!.listData![0].regionId;
      }
      update();
    });
  }

  onUpdateRegionItem(String item){
    selectedRegionName=item;

    Iterable itemData=regionListModel!.listData!.where((element) => element.regionName==item);
    if(itemData.isNotEmpty){
      selectRegionId=itemData.first.regionId;
      print(selectRegionId);
    }
    update();
  }

  updateIsFavorite(fav){
    isFavorite=fav;
    update();
  }


  void wineFilter(){

    callPostApi({
      "rating": rating,
      "wineType": selectedWine,
      "regionId": selectRegionId,
      "isFavorite": isFavorite
    }, token:AppLocalStorage().token,WebServicesConstant.filterWines)
        .then((value) {
          print(value);
          FilterModal model=FilterModal.fromJson(value);
          if(model.response==1){

            Get.find<WineController>().updateWineList(model.listData!);
            Get.back();
          }else{
            snackBarCommon("Filter", model.errorMessage);
          }

    });
  }

}