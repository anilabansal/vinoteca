

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/database/app_database.dart';
import '../../../common/utils/common_colors.dart';
import '../../../common/utils/common_font.dart';
import '../../app_common_widgets/common_all_widget.dart';
import '../../app_common_widgets/common_image_widget.dart';
import '../../app_common_widgets/common_text_widget.dart';


class TopHomeView extends StatelessWidget {
  const TopHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller=Get.put(CartController());
    return Stack(
      children: [
        Container(
          height: 90,
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(top: 5),
          child: Container(
            decoration:const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: pinkFFEFE9,blurRadius: 5.0)
                ],
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),bottomLeft:Radius.circular(20.0))
            )
          )
        ),
        Container(
          height: 90,
          decoration:const BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),bottomLeft:Radius.circular(20.0))
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20.0),
            child: GetBuilder<AppLocalStorage>(
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.isProfileCreated ? CircularImageView(imageHeight: 50,imageWidth: 50,image: controller.userDetail!.profilePic) : CircularImageView(imageHeight: 50,imageWidth: 50),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget(
                              msg: controller.isProfileCreated ? "Hello ,${controller.userDetail!.firstName!} " : "Hello",
                              font: dSansBold,
                              textSize: 18.0,
                              color: orange432821,
                            ),
                            CommonTextWidget(
                                msg: "Welcome to our app ",
                                font: dSansRegular,
                                textSize: 14.0,
                                color: black525252)
                          ],
                        )),

                    InkWell(
                      onTap: (){
                        Get.toNamed("/cart");
                      },
                      child: Stack(
                        children: [
                          SvgPicture.asset("asset/images/home/img_cart_brown.svg",width: 25,height: 25,),
                         // Obx(()=> Get.find<CartController>().cartLenght>0 ? Positioned(right:0,top: 0,width:15,height:15,child: Container(alignment:Alignment.center,decoration: BoxDecoration(color: orangeDC571F,shape: BoxShape.circle,border: Border.all(color: Colors.white,width: 1)),child: Obx(()=> CommonTextWidget(msg: Get.find<CartController>().cartLenght.toString(),color: Colors.white,textSize: 10,)),)): SizedBox())
                          GetBuilder<CartController>(builder: (cont){return cont.cartLenght>0 ? Positioned(right:0,top: 0,width:15,height:15,child: Container(alignment:Alignment.center,decoration: BoxDecoration(color: orangeDC571F,shape: BoxShape.circle,border: Border.all(color: Colors.white,width: 1)),child:  CommonTextWidget(msg: cont.cartLenght.toString(),color: Colors.white,textSize: 10,)),): SizedBox();})
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed("/notificationView");
                      },
                      child: Stack(
                        children: [
                          SvgPicture.asset("asset/images/home/img_bell.svg",width: 23,height: 23,),
                          Positioned(right:0,top: 0,width:10,height:10,child: Container(decoration: BoxDecoration(color: orangeDC571F,shape: BoxShape.circle,border: Border.all(color: Colors.white,width: 1)),))
                        ],
                      ),
                    )
                  ],
                );
              }

            ),
          ),
        )
      ]
    );
  }
}

class WineOptionView extends StatelessWidget {
  const WineOptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20.0,top:20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Column(
                  children: [

                    Expanded(child:commonWidget("asset/images/home/img_bar_store.png","Wine store",pinkFFEFE9,1),),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: MediaQuery.of(context).size.width/2.3,
                      child:commonWidget("asset/images/home/img_wine_fundamental.png","Wine\nFundamentals",yellowFFFAEE,2),
                    ),

                ],
              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width/2.3,
                        child:commonWidget("asset/images/home/img_food_menu.png","Food menu",greenEFF6F0,3),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: commonWidget("asset/images/home/img_wine_tasting.png","Tasting Wine Tour",blueEDF8FF,4),
                      )
                    ],
                  )),
            ],
          )),
          const SizedBox(height: 10),
          InkWell(
            onTap: (){
              //Get.toNamed("/topRatedWineRegion",arguments: [{"call_from": "top_rated"}]);
              //Get.toNamed("/wineRegionRatedMap");
              Get.toNamed("/topRatedWineRegion");
            },
            child: Container(
              height: 80,
                margin: const EdgeInsets.only(bottom: 20),
             //padding:const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(color: purpleF7F3FF,borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child:  Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset("asset/images/home/img_top_rated_wine.png",fit: BoxFit.fill,),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   width: 60,
                        //   height: 60,
                        //
                        //   decoration: const BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: Colors.white
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(10.0),
                        //     child:  SvgPicture.asset("asset/images/home/img_wine_glass.svg"),
                        //
                        //   ),
                        // ),
                        // const SizedBox(width: 10,),
                        CommonTextWidget(msg: "Top Rated Wines & Regions",color: Colors.white,font: dSansBold,textSize: 18.0,),

                        const SizedBox(width: 10,),
                        arrowWidget()
                      ]
                  ),

                ],
              )

            ),
          )
        ],
      ),
    );
  }

  Widget commonWidget(image,msg,colors,index){

    return InkWell(
      onTap: (){
        switch(index){
          case 1:
            Get.toNamed("/allWines");

            break;
          case 2:
            Get.toNamed("/wineFundamental");

            break;
          case 3:
            Get.toNamed("/foodMenuView");
            break;
          case 4:
            Get.toNamed("/wineTastTourMap");
            break;

        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color:colors,
            borderRadius:  const BorderRadius.all(Radius.circular(10.0))),
        child:Stack(
          fit: StackFit.expand,
        //  alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius:  const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(image,fit: BoxFit.fill,),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: MediaQuery.of(Get.context!).size.height*0.04),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CommonTextWidget(msg: msg,textAlign:TextAlign.center,color: Colors.white,font: dSansBold,textSize: 20.0,),
                ),
                arrowWidget(),

              ]
            ),
            // Positioned(
            //   right: 8,
            //   bottom: 8,
            //   child: arrowWidget(),
            // )
          ],
        )
      )
    );
  }

  Widget arrowWidget(){
    return  SizedBox(
      width: 30,
      height: 30,
      child: SvgPicture.asset("asset/images/home/img_round_bg_arrow.svg"),
    );
  }
}
