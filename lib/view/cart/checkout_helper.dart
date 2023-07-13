


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/view/cart/add_wine_from_fav.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_strings.dart';
import '../../controller/web_services/webservices_constants.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_button_widget.dart';

import '../app_common_widgets/common_image_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

class CheckoutList extends StatelessWidget {

 const CheckoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartController>(
      builder: (controller) {
        return Wrap(
          children: [
            ListView.builder(physics: NeverScrollableScrollPhysics(),
                shrinkWrap:true,itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Padding(padding:const EdgeInsets.only(top:0),child: Container(
                       padding:const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      child: Row(
                        children: [
                          // Container(
                          //   height: 80,
                          //   width: 80,
                          //   // decoration: const BoxDecoration(
                          //   //     color: pinkFDF3EF,
                          //   //     borderRadius: BorderRadius.all(Radius.circular(15.0))
                          //   // ),
                          //
                          // ),

                          SizedBox(
                            width: 90,
                            height: 90,
                            child:  controller.cartList[index].bannerImage!=null ? CommonImageView(borderRadius: BorderRadius.circular(10.0),image: WebServicesConstant.imageBaseUrl+controller.cartList[index].bannerImage.toString(),) :
                            Image.asset(
                              "asset/images/wine_store/img_bottle_glass.png",
                            ),
                            //child: Image.asset("asset/images/wine_store/img_bottle_glass.png",),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: CommonTextWidget(msg:controller.cartList[index].wineName,font: dSansBold,textSize: 18,color: black000000,maxLine: 2,)),
                                    InkWell(
                                      onTap: (){
                                        controller.deleteItemFromCart(index,controller.cartList[index]);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:18,
                                        height:18,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: black525252,width: 1)
                                        ),
                                        child: const Icon(Icons.close,color: black525252,size: 15,),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                    children: [
                                      CommonTextWidget(msg:"750 ML for ",font: dSansRegular,textSize: 14,color: black525252,),
                                      CommonTextWidget(msg:" \$ ${controller.cartList[index].price} ",font: dSansBold,textSize: 14,color: orangeDC571F,),
                                    ]),
                                const SizedBox(height: 5),
                              //  CommonTextWidget(msg:" \$ ${controller.cartList[index].price} * ${controller.cartList[index].buyQuantity} =  ${controller.getProductPrice(controller.cartList[index].buyQuantity!,int.parse(controller.cartList[index].price!))}",font: dSansBold,textSize: 14,color: orangeDC571F,),
                                // CartItemAddSub(width: 22,height: 22,backgroundColor: pinkFDF3EF,activeColor: greybgD7D7D7,unactiveColor: Colors.white,borderColor: Colors.white,wineData: controller.cartList![index],),
                              ],
                            ),
                          ),



                        ],
                      ),
                    ),),

                  ]
                ),
              );
            },itemCount: controller.cartList.length),
          ],
        );
      }
    );
  }
}

class OrderSummary extends StatelessWidget {

  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().orderSummary();
    return   Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration:  BoxDecoration(
          color: greyFCFBFB,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: pinkFFEFE9,width: 1)
      ),
     child: GetBuilder<CartController>(
       builder: (controller) {
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CommonTextWidget(msg:"Order Summary",font: dSansBold,textSize: 18,color: black000000,),
             const SizedBox(height: 10,),
             orderOptions("Order Amount","\$ ${controller.allProductTotalPrice.value.toStringAsFixed(2)}","",dSansRegular,16.0),
             const SizedBox(height: 10,),
             orderOptions("Delivery fee","\$ ${controller.deliveryPrice.value.toStringAsFixed(2)}","",dSansRegular,16.0),
              Visibility(visible: controller.isUseRewardPoints.value,child: Column(
                children: [
                  const SizedBox(height: 10),
                  orderOptions("Reward Points","\$ ${controller.rewardPoints.value}","asset/images/cart/img_diamond.svg",dSansRegular,16.0),
                ],
              ),),
             Container(
               height: 1,
               color: greyD8D8D8,
               width: double.infinity,
               margin: const EdgeInsets.only(left:5.0,right: 5.0,top: 15.0,bottom: 10.0),
             ),
             orderOptions("Total Price","\$ ${controller.totalOrderPrice.toStringAsFixed(2)}","",dSansBold,18.0),
           ],
         );
       }
     ),
    );
  }

  Widget orderOptions(title,des,image,font,size){
    return Row(
      children: [
        image!="" ? Container(margin: EdgeInsets.only(right: 10),child: SvgPicture.asset(image),) :  Container(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(msg:title,font: font,textSize: size,color: black000000,),
              CommonTextWidget(msg:des,font: dSansRegular,textSize: 16.0,color: black000000,),],
          ),
        )
      ]
    );
  }
}
