import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/payment/payment_controller.dart';
import 'package:vinoteca_app/modal/orders/address_info_modal.dart';
import 'package:vinoteca_app/view/payment/billing_address_view.dart';
import 'package:vinoteca_app/view/payment/shipping_address_view.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../common/utils/common_strings.dart';
import '../../controller/auth/create_profile_controller.dart';
import '../../controller/cart/cart_controller.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';
import '../app_common_widgets/snackbar.dart';

class CommonAddressFilled extends StatelessWidget {
  const CommonAddressFilled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) {
        return Expanded(
         // height: MediaQuery.of(context).size.height,
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  addresses(context,"Billing Address",controller.billingAddress),
                  shippingSamaAsBilling(context,controller.isShippingAddressSame.value),
                  Visibility(visible:!controller.isShippingAddressSame.value,child:addresses(context,"Shipping Address",controller.shippingAddress) ),

                ],
              ),
              TotalPricePay(
                  price: Get.find<CartController>()
                      .totalOrderPrice
                      .toStringAsFixed(2),
                  btnText: AppConstants.checkout,
                  btnClick: () {

                    controller.onClickAddressCheckout();


                  })
            ],
          ),
        );
      }
    );
  }

  Widget addresses(context,title,BillingAddress? modal){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 10.0,bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: greyFCFCFC,
        border: Border.all(color: pinkFFE3D7,width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                msg: title,
                font: dSansBold,
                textSize: 18,
                color: black000000,
              ),
              InkWell(
                onTap: (){
                 if(title.toString().toLowerCase()=="billing address"){
                   Get.find<PaymentController>().updateScreenType("billing");
                   Get.to(()=> const BillingAddressView());

                 }else{
                   Get.find<PaymentController>().updateScreenType("shipping");
                   Get.to(()=> const ShippingAddressView());
                 }
                },
                child: Container(
                    padding: const EdgeInsets.only(left:12.0,right: 12.0,bottom: 6.0,top: 6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        //border: Border.all(color: orangeEBA868, width: 1),
                        color: orangeFFEFE5),
                    child: Row(
                      children: [
                        const Icon(Icons.edit,color:redFFB0AA1,size: 12,),
                        const SizedBox(width: 5,),
                        CommonTextWidget(
                          msg: modal!=null && Get.find<PaymentController>().showAddressInfoInFeilds(modal)!="" ? "Edit" :"Add",
                          font: dSansBold,
                          textSize: 11,
                          color: redFFB0AA1,
                        )
                      ],
                    )),
              )
            ],
          ),
          const SizedBox(height: 10.0,),
          modal!=null && Get.find<PaymentController>().showAddressInfoInFeilds(modal)!=""? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: orangeFFEFE5),
                child: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Icon(Icons.location_on_outlined,color:redFFB0AA1,size: 15,),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(child: CommonTextWidget(
                msg:Get.find<PaymentController>().showAddressInfoInFeilds(modal),
                //msg:"Ramandeep kaur\n8054506079\n347/96 neta ji nagar salem tabri ludhiana,punjab",
               // msg:"${modal.firstName} ${modal.lastName}\n${modal.phoneNumber}\n${modal.streetAddress} ${modal.apartmentAddress} ${modal.suiteNumber} ${modal.country} ${modal.state} ${modal.city}\n${modal.zipCode}",
                font: dSansRegular,
                textSize: 15,
                // textAlign: TextAlign.start,
                color: black525252,
              ))
            ],
          ) : const SizedBox()
        ],
      ),
    );
  }

  Widget shippingSamaAsBilling(context,valueShip){
    return  Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 10.0,bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width:25,height: 25,child: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.grey,
            ),
            child:Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              value: valueShip,
              onChanged: (value) {

                Get.find<PaymentController>().updateShipAddress(value);
              },
            ),
          )),
          const SizedBox(
            width: 8,
          ),
          Expanded(child: CommonTextWidget(msg:"Shipping address same as billing address.",textSize: 14.0,font: dSansRegular,color: black525252,)),
        ],
      ),
    );
  }
}
