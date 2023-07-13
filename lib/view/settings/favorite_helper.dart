import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/settings/setting_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../controller/web_services/webservices_constants.dart';
import '../../modal/home/all_wines_list_modal.dart';
import '../app_common_widgets/common_image_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

class FavListView extends StatelessWidget {
  const FavListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return controller.isLoading.value
          ? CircularProgress(
              height: 30,
              width: 30,
            )
          : controller.list != null && controller.list!.length > 0
              ? GridView.builder(
                  itemCount: controller.list!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 2.7),
                  itemBuilder: (BuildContext context, int index) {
                    return GridItem(
                        index: index, wineData: controller.list![index]);
                  })
              : Center(
                child: CommonTextWidget(
                  msg: "No Favourite",
                  font: dSansBold,
                  textSize: 18,
                  color: black000000,
                ),
              );
    });
  }
}

class GridItem extends StatelessWidget {
  int? index;
  WineData? wineData;

  GridItem({Key? key, this.index, this.wineData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: index! % 2 == 0
            ? const EdgeInsets.only(right: 10, bottom: 10, top: 10, left: 20)
            : const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: const BoxDecoration(
                  //         color: pinkFDF3EF,
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(100),
                  //             topRight: Radius.circular(100))),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 15),
                  //   child: Image.asset(
                  //       "asset/images/wine_store/img_bottle_glass.png"),
                  // ),

                  wineData!.bannerImage!=null &&  wineData!.bannerImage!.isNotEmpty ?
                  Padding(padding: EdgeInsets.only(bottom: 10.0),child: CommonImageView(borderRadius: BorderRadius.circular(10.0),image: WebServicesConstant.imageBaseUrl+wineData!.bannerImage.toString()),) :
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: pinkFDF3EF,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Image.asset(
                            "asset/images/wine_store/img_bottle_glass.png"),
                      )
                    ],
                  ),
                  Positioned(
                      right: 5,
                      bottom: 50,
                      child: InkWell(
                          onTap: () {
                            Get.find<SettingController>().deleteFav(wineData!.wineId, index);
                          },
                          child: FavoriteButton(
                            isLike: true,
                          ))),
                  //const Positioned(right:5,bottom:0,child: CartItemAddSub(width: 20,height: 20,backgroundColor: Colors.white,borderColor:Colors.white,unactiveColor: Colors.white,activeColor: greyD8D8D8,))
                ],
              ),
            ),
            CommonTextWidget(
              msg: wineData!.wineName,
              font: dSansBold,
              textSize: 18,
              maxLine: 2,
              color: black000000,
            ),
            Row(
              children: [
                CommonTextWidget(
                  msg: "750 ML for ",
                  font: dSansRegular,
                  textSize: 14,
                  color: black525252,
                ),
                CommonTextWidget(
                  msg: "\$ ${wineData!.price}",
                  font: dSansBold,
                  textSize: 14,
                  color: orangeDC571F,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
