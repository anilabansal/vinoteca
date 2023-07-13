
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/modal/home/food_view_modal.dart';
import '../../database/app_database.dart';
import '../../modal/home/wine_fundamental_modal.dart';
import '../web_services/app_webservices.dart';

class WineFundamentController extends GetxController {


 List<WineFundamentalData> list=[];

 RxBool isLoading=true.obs;
 List<MenuList>? menuList=[];

 @override
  void onInit() {
    super.onInit();
    isLoading.value=true;
    update();
    wineFundaList();
  }

 void wineFundaList(){
  callGetApi({
  },token:AppLocalStorage().token, WebServicesConstant.wineFundaMental)
      .then((value) {
      WineFundamentalModal modal=WineFundamentalModal.fromJson(value);
      list.addAll(modal.data!);
      isLoading.value=false;
      update();
  });
 }

 void foodList(){
   isLoading.value=true;
   update();
   callGetApi({
   }, WebServicesConstant.foodMenu)
       .then((value) {
     FoodMenuModal modal=FoodMenuModal.fromJson(value);
     menuList!.addAll(modal.data!);
     menuList=menuList!.reversed.toList();
     isLoading.value=false;
     update();
   });
 }

}
