

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/controller/wine_store/wine_store_list_controller.dart';
import '../../../../common/utils/common_colors.dart';
import '../../../../modal/home/all_wines_list_modal.dart';
import '../../../app_common_widgets/common_all_widget.dart';
import '../../../app_common_widgets/common_image_widget.dart';
import '../../../app_common_widgets/common_text_widget.dart';
import '../../../app_common_widgets/common_toolbar.dart';
import 'filter_wine.dart';

class TopWineView extends StatelessWidget {
  const TopWineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(top: 5),
          child: Container(
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: pinkFFEFE9, blurRadius: 5.0)],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0))),
          ),
        ),
        Container(
          height: 120,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: [

                CommonToolbar(toolText:AppConstants.all_wines),
              //  CommonToolbar(toolText:"All Wines"),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: yellowFFFAEE, width: 2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            )),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              controller:
                                  Get.find<WineController>().searchText.value,
                              onChanged:
                                  Get.find<WineController>().onChangeTextWine,
                              style: const TextStyle(
                                  fontFamily: dSansMedium,
                                  fontSize: 14.0,
                                  color: orange432821),
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 5.0),
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      fontFamily: dSansMedium,
                                      fontSize: 14.0,
                                      color: orange432821)),
                            )),
                            Container(
                              width: 30,
                              height: 40,
                              padding: const EdgeInsets.all(7.0),
                              decoration: const BoxDecoration(
                                  color: greyFCFCFC,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: SvgPicture.asset(
                                  "asset/images/wine_store/img_search_orange.svg"),
                            )
                          ],
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(FilterWineView());
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: yellowFFFAEE, width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0))),
                          child: SvgPicture.asset(
                              "asset/images/wine_store/img_filter.svg"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BottomWineView extends StatelessWidget {
  BottomWineView({Key? key}) : super(key: key);

   List<WineCardItem> cards=[];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WineController>(builder: (controller) {
      cards.clear();
      if (controller.list != null && controller.list!.isNotEmpty) {
        int numberOfWidgets = controller.list!.length;
        for (int i = 0; i < numberOfWidgets; i++) {
          cards.add(WineCardItem(
            wineData: controller.list![i],
            index: i,
          ));
        }
      } else {
        cards = [];
      }

      return controller.isLoading.value
          ? CircularProgress(
              width: 30,
              height: 30,
            )
          : controller.list != null && controller.list!.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonTextWidget(
                                msg: '${controller.viewType} View',
                                font: dSansMedium,
                                textSize: 18.0,
                                color: black000000),
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: pinkFDF3EF,
                                      border: Border.all(color: pinkFDF3EF),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6.0))),
                                  child: InkWell(
                                    onTap: () {
                                      controller.updateViewType("Card");
                                    },
                                    child: Container(
                                      width: 35,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: controller.viewType
                                                      .toLowerCase() ==
                                                  "card"
                                              ? Colors.white
                                              : pinkFDF3EF,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(6.0))),
                                      child: SvgPicture.asset(controller
                                                  .viewType
                                                  .toLowerCase() ==
                                              "card"
                                          ? "asset/images/wine_store/img_card_view.svg"
                                          : "asset/images/wine_store/img_card_unactive.svg"),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: pinkFDF3EF,
                                      border: Border.all(color: pinkFDF3EF),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6.0))),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.updateViewType("Grid");
                                        },
                                        child: Container(
                                          width: 35,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: controller.viewType
                                                          .toLowerCase() ==
                                                      "grid"
                                                  ? Colors.white
                                                  : pinkFDF3EF,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(6.0))),
                                          child: SvgPicture.asset(controller
                                                      .viewType
                                                      .toLowerCase() ==
                                                  "grid"
                                              ? "asset/images/wine_store/img_grid_active_orange.svg"
                                              : "asset/images/wine_store/img_grid_unactive_grey.svg"),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.updateViewType("List");
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: controller.viewType
                                                          .toLowerCase() ==
                                                      "list"
                                                  ? Colors.white
                                                  : pinkFDF3EF,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(6.0))),
                                          child: SvgPicture.asset(controller
                                                      .viewType
                                                      .toLowerCase() ==
                                                  "list"
                                              ? "asset/images/wine_store/img_list_active_orange.svg"
                                              : "asset/images/wine_store/img_list_unative_grey.svg"),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: controller.viewType.toLowerCase() == "card"
                            ? AllWineList(
                                cards: cards,
                              )
                            : controller.viewType.toLowerCase() == "list"
                                ? ListView.builder(
                                    itemCount: controller.list!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return WineListItem(
                                        wineData: controller.list![index],
                                        index: index,
                                      );
                                    },
                                  )
                                : GridView.builder(
                                    itemCount: controller.list!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 2 / 2.7),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return WineGridItem(
                                        index: index,
                                        wineData: controller.list![index],
                                      );
                                    },
                                  ))
                  ],
                )
              : Center(
                  child: SizedBox(
                    child: CommonTextWidget(
                        msg: "No wines Found",
                        font: dSansBold,
                        textSize: 18.0,
                        color: black000000),
                  ),
                );
    });
  }
}

class WineCardItem extends StatelessWidget {
  int? index;

  WineData? wineData;

  WineCardItem({Key? key, this.index, this.wineData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Get.toNamed("/wineDetail");
        Get.find<WineController>().onClickWineItem(index);
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                //padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: pinkFDF3EF,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // ClipRRect(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     child: Image.asset(
                    //       "asset/images/wine_store/img_bottle_glass.png",
                    //     )
                    //
                    // ),

                    wineData!.wineImages!.isNotEmpty ? CommonImageView(borderRadius: BorderRadius.circular(10.0),image: WebServicesConstant.imageBaseUrl+wineData!.wineImages![0].wineImages1.toString(),) :Image.asset(
                      "asset/images/wine_store/img_bottle_glass.png",
                    ),

                    Positioned(
                        top: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.find<WineController>().updateWineFav(index);
                            },
                            child: FavoriteButton(
                              width: 50,
                              height: 50,
                              isLike: wineData!.isLike!,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            CommonTextWidget(
              msg: wineData!.wineName,
              font: dSansBold,
              textSize: 18,
              maxLine: 2,
              color: black000000,
            ),
            const SizedBox(height: 10),
            Row(children: [
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
              )
            ]),
            const SizedBox(height: 10),
            CommonRichTextWidget(maxLines:5,textSpanList:
            [

              TextSpan(text:Get.find<WineController>().showDescription(index), style:TextStyle(color:black525252,fontFamily: dSansRegular,fontSize:12.0) ),
              wineData!.description!.length >100 ? TextSpan(text: wineData!.showMore!? " Read Less" :" Read More",style: TextStyle(color: Colors.black,fontFamily: dSansBold,fontSize: 12.0),recognizer: TapGestureRecognizer()..onTap = ()=> Get.find<WineController>().onClickShowMore(index)) : TextSpan()]),
            // TextSpan(text: controller.wineData.value.showMore!? " Read Less" :" Read More",style: TextStyle(color: Colors.black,fontFamily: dSansBold,fontSize: 12.0),recognizer: TapGestureRecognizer()..onTap = ()=> controller.onClickShowMore())]),

          ],
        ),
      ),
    );
  }
}

class WineListItem extends StatelessWidget {
  int? index;

  WineData? wineData;

  WineListItem({Key? key, this.index, this.wineData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return InkWell(
      onTap: () {
        Get.find<WineController>().onClickWineItem(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: pinkFDF3EF,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                      ),
                    ),
                  ),


                  wineData!.wineImages!.isNotEmpty ? CommonImageView(borderRadius: BorderRadius.circular(10.0),image: WebServicesConstant.imageBaseUrl+wineData!.wineImages![0].wineImages1.toString(),) :Image.asset(
                    "asset/images/wine_store/img_bottle_glass.png",
                  ),

                  //Image(image: NetworkImage(WebServicesConstant.imageBaseUrl+wineData!.wineImages![0].wineImages1!,)),
                 //Positioned(bottom: 5,right: 5,child: FavoriteButton(isLike: wineData!.isLike,),)
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    msg: wineData!.wineName,
                    font: dSansBold,
                    textSize: 18,
                    maxLine: 2,
                    color: black000000,
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisSize:MainAxisSize.min,children: [
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
                  ]),
                  const SizedBox(height: 10),
                  CartItemAddSub(
                    width: 30,
                    height: 30,
                    backgroundColor: pinkFDF3EF,
                    activeColor: greybgD7D7D7,
                    unactiveColor: Colors.white,
                    borderColor: Colors.white,
                    wineData: wineData,
                  ),

                  GetBuilder<CartController>(builder: (controller) {
                    WineData _wine;
                    if (controller != null) {
                      _wine = controller.getWineExistInCart(wineData!);
                    } else {
                      _wine = wineData!;
                    }
                    return Visibility(
                      visible: _wine.showStock!,
                      child: CommonTextWidget(
                        msg: wineData!.stock==0? "Out of stock" : "${wineData!.stock} bottles left" ,
                        font: dSansMedium,
                        textSize: 12,
                        color: redFFF44336,
                      ),);
                  })
                ],
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: (){
                Get.find<WineController>().updateWineFav(index);
              },
              child: FavoriteButton(isLike: wineData!.isLike,),
            )
          ],
        ),
      ),
    );
  }
}

class WineGridItem extends StatelessWidget {
  int? index;

  WineData? wineData;

  WineGridItem({Key? key, this.index, this.wineData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return InkWell(
      onTap: () {
        Get.find<WineController>().onClickWineItem(index);
      },
      child: Container(
        margin: index! % 2 == 0
            ? const EdgeInsets.only(right: 10, bottom: 10, top: 10, left: 20)
            : const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(fit:StackFit.expand,
                  alignment: Alignment.center, children: [
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 15),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     decoration: const BoxDecoration(
                //       color: pinkFDF3EF,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15, bottom: 15),
                //   child: Image.asset(
                //       "asset/images/wine_store/img_bottle_glass.png"),
                // ),

                Padding(padding: const EdgeInsets.only(top: 15, bottom: 15),child: wineData!.wineImages!.isNotEmpty ? CommonImageView(borderRadius: BorderRadius.circular(10.0),image: WebServicesConstant.imageBaseUrl+wineData!.wineImages![0].wineImages1.toString(),) :Image.asset(
                  "asset/images/wine_store/img_bottle_glass.png",
                ),),
                Positioned(
                    right: 5,
                    bottom: 40,
                    child: InkWell(
                      onTap: () {
                        Get.find<WineController>().updateWineFav(index);
                      },
                      child: FavoriteButton(
                        isLike: wineData!.isLike!,
                      ),
                    )),
                Positioned(
                    right: 5,
                    bottom: 0,
                    child: CartItemAddSub(
                      width: 30,
                      height: 30,
                      backgroundColor: Colors.white,
                      borderColor: Colors.white,
                      unactiveColor: Colors.white,
                      activeColor: greyD8D8D8,
                      wineData: wineData,
                    ))
              ]),
            ),
            const SizedBox(height: 2),
            CommonTextWidget(
              msg: wineData!.wineName,
              font: dSansBold,
              textSize: 18,
              color: black000000,
              maxLine: 1,
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
                  msg: "\$ ${wineData!.price.toString()}",
                  font: dSansBold,
                  textSize: 14,
                  color: orangeDC571F,
                ),
              ],
            ),
        GetBuilder<CartController>(builder: (controller) {
          WineData _wine;
          if (controller != null) {
            _wine = controller.getWineExistInCart(wineData!);
          } else {
            _wine = wineData!;
          }
          return Visibility(
            visible: _wine.showStock!,
            child: CommonTextWidget(
              msg: wineData!.stock==0? "Out of stock" : "${wineData!.stock} bottles left" ,
              font: dSansMedium,
              textSize: 12,
              color: redFFF44336,
            ),);
           })
          ],
        ),
      ),
    );
  }
}

class AllWineList extends StatelessWidget {
  List<Widget>? cards;

  AllWineList({Key? key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppinioSwiper(
      cards: cards,
      direction: AppinioSwiperDirection.left,
      maxAngle: 30,
      allowUnswipe: false,
      unlimitedUnswipe: false,
    );
  }
}
