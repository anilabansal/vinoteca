



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/wine_store/wine_detail_controller.dart';
import 'package:vinoteca_app/database/app_database.dart';
import '../../modal/home/all_wines_list_modal.dart';
import '../../view/app_common_widgets/progress_dialog.dart';
import '../../view/bottom_bar/home/wine_store/all_wines_helper.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class WineController extends GetxController{

  RxBool isLoading = true.obs;
  RxBool isSearch = false.obs;
  RxInt selectedIndex = 0.obs;

  List<WineData>? list=[];
  List<WineData>? withOutSearchWineList=[];
  List<WineData>? tempList=[];
  List<WineCardItem>? cardList=[];

  Rx<TextEditingController> ratingText = TextEditingController().obs;
  Rx<TextEditingController> searchText = TextEditingController().obs;

  RxString viewType = "Card".obs;


  @override
  void onInit() {
    super.onInit();
    wineList();
  }

  onChangeTextWine(String name){
    if(name.isEmpty){
      isSearch.value=false;
      list!.clear();
      list!.addAll(withOutSearchWineList!);
      update();
    }else{

      isSearch.value=true;
    }
     searchWine(name);
  }

  updateWineList(List<WineData> listData){
    list!.clear();
    list!.addAll(listData);
    update();
  }

  updateViewType(String view){
    viewType.value=view;
    update();
  }

  onClickWineItem(index){
    selectedIndex.value=index;

    Get.toNamed("/wineDetail",arguments: [{"wineId":Get.find<WineController>().list![Get.find<WineController>().selectedIndex.value].wineId},
                                           {"call_from":"wine_list"}]);
  }


  updateWineFav(index){

    if(list![index].isLike!){
      //cardList![index].wineData!.isLike=false;
      list![index].isLike=false;
      update();
      deleteFav(list![index].wineId,index);
    }else{
     // cardList![index].wineData!.isLike=true;
      list![index].isLike=true;
      update();
      addFav(list![index].wineId,index);
    }

  }


  rateWine(wineId){
    ProgressDialog.showProgressDialog(Get.context!);
    //hit api
    callPostApi(
        {
          "WineId":wineId,
          "Ratings1":4.0,
          "Review":ratingText.value.text
        },WebServicesConstant.rateWine).then((value) {
          Navigator.of(Get.context!).pop();
    });
  }



  void wineList(){

    callGetApi({
    }, token:AppLocalStorage().token,WebServicesConstant.allWinesList)
        .then((value) {
      isLoading.value=false;
      withOutSearchWineList!.clear();
      WineListModal wineListModal=WineListModal.fromJson(value);
      withOutSearchWineList!.addAll(wineListModal.data!);
      list!.addAll(wineListModal.data!);
      if(list!.isNotEmpty){
        selectedIndex.value=0;
      }
      update();

    });
  }

  void increaseQuantity(index){
    list![index].buyQuantity=list![index].buyQuantity!+1;
    update();
  }

  void decreaseQuantity(index){
    if(list![index].buyQuantity!>1){
      list![index].buyQuantity=list![index].buyQuantity!-1;
    }
    update();
  }


  void addFav(wineId,index){

    callPostApi({"wineId":wineId
    },token:AppLocalStorage().token, WebServicesConstant.addWineToFav)
        .then((value) {

    });
  }

  void deleteFav(wineId,index){

    callPostApi({"wineId":wineId
    },token:AppLocalStorage().token, WebServicesConstant.unFavWine)
        .then((value) {

    });

  }


  void searchWine(name){

    callPostApi({"searchwines":name
    },token:AppLocalStorage().token, WebServicesConstant.searchWinesWithName)
        .then((value) {
        list!.clear();
        tempList!.clear();
        WineListModal wineListModal=WineListModal.fromJson(value);
        tempList!.addAll(wineListModal.data!);
        list!.addAll(tempList!);
        update();

    });
  }

  onClickShowMore(index){
    cardList![index].wineData!.showMore=!cardList![index].wineData!.showMore!;
    print("showMore${cardList![index].wineData!.showMore}");
    update();
  }


  String showDescription(index){
    String des="";
    if(list![index].showMore!){
      des=list![index].description!;

    }else{
      if(list![index].description!.length<100){
        des=list![index].description!;
      }else {
        des=list![index].description!.substring(0,100);
      }

    }
    return des;
  }





}