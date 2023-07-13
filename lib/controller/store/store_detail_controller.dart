

import 'package:get/get.dart';
import '../../database/app_database.dart';
import '../../modal/home/store_detail_modal.dart';
import '../../modal/home/store_list_modal.dart';
import '../../view/app_common_widgets/bottom_sheet_common.dart';
import '../../view/store/store_detail_view.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class StoreController extends GetxController{

  RxBool isShowStoreWines=false.obs;
  RxBool isListLoading=true.obs;
  StoreDetailModal? storeDetailModal;
  List<ListData>? storeDetailModalList=[];


  @override
  void onInit() {
    super.onInit();
    storeList();
  }

  updateWinesVisibility(isShow){
    isShowStoreWines.value=isShow;
    update();
  }


  void storeList(){

    callGetApi({},token:AppLocalStorage().token, WebServicesConstant.storeList)
        .then((value) {
           print(value);
           isListLoading.value=false;
           StoreListModal modal=StoreListModal.fromJson(value);
           storeDetailModalList!.addAll(modal.listData!);
           //storeDetailModal=StoreDetailModal.fromJson(value);
           update();
    });
  }


  void storeDetail(id){

    callPostApi({"storeId":id},token:AppLocalStorage().token, WebServicesConstant.storeDetail)
        .then((value) {
         print(value);
         storeDetailModal=StoreDetailModal.fromJson(value);
         update();
    });
  }

  onClickListItem(id){
    storeDetail(id);
    BottomSheetCommon.showSheet(const StoreDetailView());
  }
}