
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/controller/wine_store/wine_store_list_controller.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/view/app_common_widgets/snackbar.dart';
import '../../modal/home/all_wines_list_modal.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class WineDetailController extends GetxController{

  RxBool isListView=true.obs;
  Rx<WineData> wineData = WineData().obs;
  bool favLoading=false;
  RxString bannerImage="".obs;

  RxInt? wineId=0.obs;

  @override
  void onInit() {
    super.onInit();

  }

  updateWineId(wineid){
    wineId!.value=wineid;
    //wineDetailApi();
  }

  updateBanner(String bannerImagee){
    print("bannerImagee${bannerImagee}");
    bannerImage.value=bannerImagee;
    update();
  }

  void wineDetailApi(wineId){
    callPostApi({"wineId":wineId
    },token:AppLocalStorage().token, WebServicesConstant.wineDetail)
        .then((value) {
          if(value!=null)
         { wineData.value=WineData.fromJson(value["data"]);
         if(wineData.value.wineImages!=null && wineData.value.wineImages!.isNotEmpty){
           updateBanner(WebServicesConstant.imageBaseUrl+wineData.value.wineImages![0].wineImages1.toString());
         }
         update();
         }
    });
  }

  onClickShowMore(){
   wineData.value.showMore=!wineData.value.showMore!;
   update();
  }


  String showDescription(){
    String des="";
    if(wineData.value.showMore!){
      des=wineData.value.description!;
      
    }else{
      if(wineData.value.description!.length<100){
        des=wineData.value.description!;
      }else {
        des=wineData.value.description!.substring(0,100);
      }

    }
    return des;
  }

  onClickAddWine(){
    WineData _wine=Get.find<CartController>().getWineExistInCart(Get.find<WineController>().list![Get.find<WineController>().selectedIndex.value]);
    if(_wine.buyQuantity!>0){
      Get.toNamed("/cart");
    }else{
     snackBarCommon("Wine Detail", "Please add quantity first");
    }
  }


  void addFav(wineId,type){

    callPostApi({"wineId":wineId
    },token:AppLocalStorage().token, WebServicesConstant.addWineToFav)
        .then((value) {
    wineData.value.isLike=true;
    favLoading=false;
    if(type=="wine_list")
    {
      Get.find<WineController>().list![Get.find<WineController>().selectedIndex.value].isLike=true;
      Get.find<WineController>().update();
    }
    update();
    });
  }

  void deleteFav(wineId,type){

    callPostApi({"wineId":wineId
    },token:AppLocalStorage().token, WebServicesConstant.unFavWine)
        .then((value) {
      favLoading=false;
      wineData.value.isLike=false;
      if(type=="wine_list") {
        Get
            .find<WineController>()
            .list![Get
            .find<WineController>()
            .selectedIndex
            .value].isLike = false;
        Get.find<WineController>().update();
      }
      update();
    });
  }
}