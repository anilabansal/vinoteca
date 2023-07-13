
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../common/utils/common_strings.dart';

import '../../controller/web_services/webservices_constants.dart';
import '../app_common_widgets/common_image_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import 'add_wine_from_fav.dart';

class WineCheckout extends StatelessWidget {

  const WineCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartController>(
      builder: (controller) {
        return  controller.isCartLoading ? const SizedBox() : controller.cartList.isNotEmpty ? Column(
          children: [

            Visibility(
              visible: AppLocalStorage().userDetail!.isLoyaltySignUp ?? false,
              child: Padding(
                padding: const EdgeInsets.only(left:30.0,right: 30),
                child: Row(
                  children: [
                    //SvgPicture.asset("asset/images/auth/img_uncheck_grey.svg",width: 15,height: 15,),
                    SizedBox(width:22,height: 22,child: Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: Colors.grey,
                      ),
                      child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        value: controller.isUseRewardPoints.value,
                        onChanged: (value) {
                          controller.updateRewardPoint();
                        },
                      ),
                    )),
                    const SizedBox(width: 10),
                    CommonTextWidget(msg:"Use Reward Points (${controller.rewardPoints.value}=\$${controller.rewardPointsPrice.value})",font: dSansRegular,textSize: 14,color: black525252),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("asset/images/cart/img_write_detail.svg",width: 18,height: 18,),
                        const SizedBox(width: 10),

                        Expanded(child: SizedBox(height:35,
                            child: TextField(
                              focusNode: controller.focus,
                              controller: controller.instructionCart.value,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontFamily:dSansMedium,fontSize:14,color: orange432821,fontWeight: FontWeight.w500),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 10.0),
                                hintText: "Write special instructions",
                                hintStyle: TextStyle(fontFamily:dSansMedium,fontSize:14,fontWeight: FontWeight.w500,color: black000045),
                              ),
                            ))),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.25,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                  TotalPricePay(price: controller.allProductTotalPrice.toStringAsFixed(2),btnText: AppConstants.checkout,btnClick:(){
                    FocusScope.of(context).unfocus();
                    controller.onClickCartCheckout();
                  })
                ],
              ),
            ),
          ],
        ) : const SizedBox();
      }
    );
  }

}


class CartItemList extends StatelessWidget {

  CartItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartController>(
      builder: (controller) {
        return controller.isCartLoading ? Center(child: CircularProgress()) :controller.cartList.isNotEmpty ?
        ListView.builder(itemBuilder: (context,index){
          return SizedBox(width:MediaQuery.of(context).size.width,child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Stack(
                      fit: StackFit.expand,
                      // alignment: Alignment.center,
                      children: [
                        // Align(
                        //   alignment:Alignment.bottomCenter,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(top:8.0),
                        //     child: Container(
                        //
                        //       decoration: const BoxDecoration(
                        //           color: pinkFDF3EF,
                        //           borderRadius: BorderRadius.all(Radius.circular(15.0))
                        //       ),),
                        //   ),
                        // ),
                        // Image.asset("asset/images/wine_store/img_bottle_glass.png",),

                        controller.cartList[index].bannerImage!=null ?
                        CommonImageView(borderRadius: BorderRadius.circular(10.0),image: WebServicesConstant.imageBaseUrl+controller.cartList[index].bannerImage.toString(),)
                            :
                        Image.asset(
                          "asset/images/wine_store/img_bottle_glass.png",
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidget(msg:controller.cartList[index].wineName,maxLine:3,font: dSansBold,textSize: 18,color: black000000,),
                        const SizedBox(height: 10),
                        Row(
                            children: [
                              CommonTextWidget(msg:"750 ML for ",font: dSansRegular,textSize: 14,color: black525252,),
                              CommonTextWidget(msg:"\$ ${controller.cartList[index].price}",font: dSansBold,textSize: 14,color: orangeDC571F,),
                            ]
                        ),
                        const SizedBox(height: 10),
                        controller.cartList[index].stock!>0? CartItemAddSub(width: 30,height: 30,backgroundColor: Colors.white,activeColor: greybgD7D7D7,unactiveColor: Colors.white,borderColor: Colors.white,wineData: controller.cartList[index],) : SizedBox(
                          child: CommonTextWidget(msg:"Out of Stock ",font: dSansRegular,textSize: 14,color: redFFF44336,),
                        ),

                    Visibility(
                      visible: controller.cartList[index].stock!=0 && controller.cartList[index].showStock!,
                      child: CommonTextWidget(
                        msg: "${controller.cartList[index].stock} bottles left",
                        font: dSansMedium,
                        textSize: 12,
                        color: redFFF44336,
                      ))
                      ]
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: (){
                      controller.deleteItemFromCart(index,controller.cartList[index]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width:20,
                      height:20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: black525252,width: 1)
                      ),
                      child: const Icon(Icons.close,color: black525252,size: 15,),
                    ),
                  )

                ],
              ),
              const Divider()
            ],
          ));
        },itemCount: controller.cartList.length) :
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonTextWidget(msg:"No items in cart",font: dSansMedium,textSize: 18.0,color: black000000,),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.offNamed("/allWines");
                },
                child: Container(
                  padding: const EdgeInsets.only(top:10,bottom: 10,right: 20,left:20),
                  decoration: BoxDecoration(
                      color: orangeDC571F,
                      borderRadius: BorderRadius.circular(6.0)
                  ),
                  child:CommonTextWidget(msg: "Go to Wines",font: dSansMedium,textSize: 15.0,color: Colors.white,),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}