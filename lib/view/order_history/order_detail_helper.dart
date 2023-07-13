import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/order_history/order_detail_controller.dart';
import 'package:vinoteca_app/view/bottom_bar/home/wine_store/wine_detail_view.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_text_widget.dart';


class OrderProductImageView extends StatelessWidget {

  double? bgImageWidth;
  double? bgImageHeight;

  OrderProductImageView({Key? key,this.bgImageHeight,this
      .bgImageWidth}) : super(key: key);
  List<String> imageList=["asset/images/dummy/img_order_detail.png",
    "asset/images/dummy/img_order_detail.png",
    "asset/images/dummy/img_order_detail.png",
    "asset/images/dummy/img_order_detail.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: bgImageWidth!,maxHeight: bgImageHeight!),
      decoration:  const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),child: Stack(
      children: [
        Image.asset("asset/images/dummy/img_order_detail.png",fit: BoxFit.fill,width: bgImageWidth!,height: bgImageHeight!),
         Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: const BoxDecoration(
                  color: black000045,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              padding: const EdgeInsets.only(left: 10, bottom: 5, top: 5.0, right: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                      "asset/images/order_history/img_takeaway.svg"),
                  const SizedBox(
                    width: 8,
                  ),
                  CommonTextWidget(
                      msg: "Take Away",
                      font: dSansBold,
                      textSize: 15.0,
                      color: Colors.white)
                ],
              ),
            )),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: bgImageWidth!/2,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0,left: 5.0,right: 5.0),
              child: ListView.builder(itemBuilder: (context,index){
                return images(imageList[index],index);
              },itemCount: 4,shrinkWrap:true,physics: NeverScrollableScrollPhysics(),scrollDirection: Axis.horizontal,),

            ),
          ),
        )
      ],
    ),);
  }

  Widget  images(imagePath,index){
    return
      index==3 ? Container(
        height: 35,
        width: 35,
        alignment: Alignment.center,
        decoration:  BoxDecoration(
            color:  Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: Colors.white,width: 1)

        ),child: CommonTextWidget(msg:"+2",textSize: 14.0,font: dSansMedium,color: black000000,),)
          :
      Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.only(right: 5),
          decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.white,width: 1)

          ),child: ClipRect(
        child: Image.asset("asset/images/dummy/img_wine_review1.png",fit: BoxFit.fill,),
      ));
  }
}
class OrderedWine extends StatelessWidget {

  const OrderedWine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<OrderDetailController>(
        builder: (controller) {
          return Wrap(
            children: [
              controller.modal!.data!.orderWineData!.isNotEmpty ?  ListView.builder(shrinkWrap:true,physics:const NeverScrollableScrollPhysics(),itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Get.toNamed("/wineDetail",arguments: {"wineId":controller.modal!.data!.orderWineData![index].wineId});
                  },
                  child: SizedBox(width:MediaQuery.of(context).size.width,child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: 100,
                            width: 100,
                            child: controller.modal!.data!.orderWineData![index].wineImage!=null ?
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              child: Image.network(controller.modal!.data!.orderWineData![index].wineImage!,fit: BoxFit.fill,),
                            ):
                            Stack(
                              fit: StackFit.expand,
                              children: [
                                Align(
                                  alignment:Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Container(

                                      decoration: const BoxDecoration(
                                          color: pinkFDF3EF,
                                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                                      ),),
                                  ),
                                ),
                                Image.asset("asset/images/wine_store/img_bottle_glass.png",),

                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonTextWidget(msg:controller.modal!.data!.orderWineData![index].wineName,maxLine:3,font: dSansBold,textSize: 18,color: black000000,),
                                  const SizedBox(height: 10),
                                  Row(
                                      children: [
                                        CommonTextWidget(msg:"",font: dSansRegular,textSize: 14,color: black525252,),
                                        CommonTextWidget(msg:"\$ ${controller.modal!.data!.orderWineData![index].price}",font: dSansBold,textSize: 14,color: orangeDC571F,),
                                      ]
                                  )
                                ]
                            ),
                          ),
                          CommonTextWidget(msg:"QT: ${controller.modal!.data!.orderWineData![index].wineQuantity}",font: dSansRegular,textSize: 14,color: black525252,),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  )),
                );
              },itemCount: controller.modal!.data!.orderWineData!.length) : SizedBox()
            ],
          );
        }
    );
  }

  Widget orderOptions(title,des,image,font,size){
    return Row(
        children: [

          image!="" ? Container(margin: const EdgeInsets.only(right: 10),child: SvgPicture.asset(image)) :  Container(),
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



class OrderSummary extends StatelessWidget {

  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration:  BoxDecoration(
          color: greyFCFBFB,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: pinkFFEFE9,width: 1)
      ),
      child: GetBuilder<OrderDetailController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidget(msg:"Order Summary",font: dSansBold,textSize: 18,color: black000000,),
                const SizedBox(height: 10,),
                orderOptions("Order Amount","\$ ${controller.modal!.data!.orderData!.orderAmount}","",dSansRegular,16.0),
                const SizedBox(height: 10,),
                orderOptions("Delivery fee","\$ ${controller.modal!.data!.orderData!.deliveryFees!.toStringAsFixed(2)}","",dSansRegular,16.0),
                Visibility(visible: controller.modal!.data!.orderData!.isRewardPointsadded!,child: Column(
                  children: [
                    const SizedBox(height: 10),
                    orderOptions("Reward Points","\$ ${controller.modal!.data!.orderData!.rewardPoints!}","asset/images/cart/img_diamond.svg",dSansRegular,16.0),
                  ],
                ),),
                Container(
                  height: 1,
                  color: greyD8D8D8,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left:5.0,right: 5.0,top: 15.0,bottom: 10.0),
                ),
                orderOptions("Total Price","\$ ${controller.modal!.data!.orderData!.orderTotalAmout}","",dSansBold,18.0),
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



class OrderPaymentBy extends StatelessWidget {
  const OrderPaymentBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonTextWidget(
            msg: "Debit card",
            font: dSansMedium,
            textSize: 13.0,
            color: orange432821),
        const SizedBox(
          width: 10,
        ),
        CommonTextWidget(
            msg: "213234243****",
            font: dSansBold,
            textSize: 13.0,
            color: black525252),
        const SizedBox(
          width: 10,
        ),
        CommonTextWidget(
            msg: "Exp:-23,june-22",
            font: dSansRegular,
            textSize: 12.0,
            color: black525252),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset("asset/images/cart/img_card_mastero.svg",
            width: 25, height: 25)
      ],
    );
  }
}


class DeliveryButton extends StatelessWidget {
  String? msg;
  VoidCallback? callback;
  DeliveryButton({Key? key,this.msg,this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(foregroundColor: greyD8D8D8,backgroundColor: Colors.white),
            onPressed: (){
              callback!();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,

                  decoration: BoxDecoration(
                      color: green688D6B,
                      shape: BoxShape.circle),

                ),
                SizedBox(width: 10,),
                CommonTextWidget(msg:msg,textSize: 18.0,font: dSansBold,color: green688D6B,)
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        msg!.toLowerCase()=="pending"? CommonTextWidget(msg:AppConstants.orderConfirmed,textSize: 14.0,font: dSansRegular,color: black525252,) : SizedBox()
      ],
    );
  }
}
