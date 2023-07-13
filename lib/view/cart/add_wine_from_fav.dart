

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../controller/settings/setting_controller.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';


class AddWineFromFavView extends StatelessWidget {
  const AddWineFromFavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SettingController>().favWineList();
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,

            child: CloseButtonCommon(width: 30,height: 30,),
          ),
          SvgPicture.asset("asset/images/cart/img_add_from_fav.svg"),
          const SizedBox(
            height: 20,
          ),
          CommonTextWidget(msg:AppConstants.AddwinesFromFavoriteList,font: dSansBold,textSize: 22.0,color: black000000,) ,
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20.0),
            child: CommonTextWidget(msg:AppConstants.Addwinest,textAlign: TextAlign.center,font: dSansRegular,textSize: 14.0,color: black525252,),
          ) ,
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width/1.5,
            child:GetBuilder<SettingController>(
              builder: (controller) {
                return controller.isLoading.value ? CircularProgress() : controller.list!.isNotEmpty ? ListView.builder(itemBuilder: (context,index){
                  return CommonWineBg(wineData: controller.list![index],showAddToCart:true);
                },itemCount: controller.list!.length,scrollDirection: Axis.horizontal) : SizedBox(
                  child: CommonTextWidget(msg:"No Favorite List",font: dSansMedium,color: black000000,textSize: 14.0,),
                );
              }
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 60,
             child: CommonButton(msg: "Proceed to checkout",callback: (){
                 Get.back();
                 Get.toNamed("/checkOutView");
             },))
        ],
      ),
    );
  }
}