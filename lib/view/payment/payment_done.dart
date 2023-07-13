

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../controller/bottom_bar/bottom_bar_controller.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

class PaymentDone extends StatelessWidget {
  const PaymentDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SvgPicture.asset("asset/images/auth/img_check_yellow.svg", fit: BoxFit.fill),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonTextWidget(msg:AppConstants.paymentDone,textSize: 22.0,font: dSansBold,color: black000000,),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextWidget(msg:AppConstants.desPayment1+Get.find<CartController>().totalOrderPrice.toStringAsFixed(2)+AppConstants.desPayment2,textAlign:TextAlign.center,textSize: 16.0,font: dSansRegular,color: black525252,),
                  const SizedBox(
                    height: 50,
                  ),

                  CommonButton(msg: AppConstants.okay,callback: (){
                     Get.find<CartController>().clearAllData();
                    // Get.delete<CartController>();
                    Get.offAllNamed("/mainScreen");
                    Get.find<BottomBarController>().onClickOption(1);
                  }),

                  const SizedBox(
                    height: 30,
                  ),

                ]
              ),
            )
        )
    );
  }
}
