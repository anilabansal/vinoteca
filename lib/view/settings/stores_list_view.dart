

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/store/store_detail_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';
import 'package:vinoteca_app/view/bottom_bar/home/wine_store/wine_detail_helper.dart';
import 'package:vinoteca_app/view/store/store_detail_view.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../common/utils/common_strings.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';
import '../bottom_bar/home/top_rated/top_rated_helper.dart';

class StoreListView extends StatelessWidget {
  const StoreListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CommonToolbar(toolText: AppConstants.storeList,color: Colors.transparent,),

            Expanded(
              child: GetBuilder<StoreController>(
                builder: (controller) {
                  return controller.isListLoading.value ? Center(child: CircularProgress()): ListView.builder(itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        controller.onClickListItem(controller.storeDetailModalList![index].storeId);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: greyE9E9E9, width: 2),
                                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset(
                                    "asset/images/dummy/img_pair1.png",
                                    width: 80,
                                    height: 80,
                                  ),

                                 // ClipRRect(borderRadius:BorderRadius.circular(10.0),child: Image.network(controller.storeDetailModalList![index].storeImage!,width: 70,height: 70,fit: BoxFit.fill,)),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:8.0,bottom: 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: CommonTextWidget(
                                                    msg: controller.storeDetailModalList![index].storeName,
                                                    font: dSansBold,
                                                    textSize: 18.0,
                                                    color: black000000),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  // Get.find<StoreDetailController>().updateWinesVisibility(true);
                                                  // BottomSheetCommon.showSheet(StoreDetailView());
                                                },
                                                child: Container(
                                                  padding:const  EdgeInsets.only(left:10.0,right: 10.0,top: 8.0,bottom: 8.0),
                                                  decoration: const BoxDecoration(
                                                      color: orangeFFEFE5,
                                                      borderRadius: BorderRadius.all(Radius.circular(6))
                                                  ),
                                                  child: SvgPicture.asset("asset/images/wine_store/img_arrow_right_orange.svg"),
                                                ),
                                              )

                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_sharp,
                                                color: orangeDC571F,
                                                size: 14.0,
                                              ),
                                              CommonTextWidget(
                                                  msg: controller.storeDetailModalList![index].location,
                                                  color: black525252,
                                                  font: dSansRegular,
                                                  textSize: 14.0)
                                            ],
                                          ),

                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [

                                              // ConstrainedBox(
                                              //   constraints: BoxConstraints(
                                              //       maxWidth: MediaQuery.of(context).size.width*0.45
                                              //   ),
                                              //   child: Padding(
                                              //     padding: const EdgeInsets.only(left:10,top: 3),
                                              //     child: Row(
                                              //       mainAxisAlignment: MainAxisAlignment.end,
                                              //       crossAxisAlignment: CrossAxisAlignment.start,
                                              //       children: [
                                              //         const Icon(Icons.alarm_sharp,color: orangeDC571F,size: 15,),
                                              //         CommonTextWidget(
                                              //             msg: "Opening hour:",
                                              //             font: dSansRegular,
                                              //             textSize: 10.0,
                                              //             color: orangeDC571F),
                                              //         Flexible(
                                              //           child: CommonTextWidget(
                                              //             //msg:"",
                                              //               msg: " 9 am to 5 pm",
                                              //               font: dSansRegular,
                                              //               textSize: 10.0,
                                              //               color: black525252),
                                              //         )
                                              //       ],
                                              //     ),
                                              //   ),
                                              // )
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    );
                  },itemCount: controller.storeDetailModalList!.length);
                }
              ),
            ),


          ],
        ),
      ),
    );
  }
}

