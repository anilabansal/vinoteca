

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

import '../app_common_widgets/common_toolbar.dart';
import 'payment_method_helper.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonToolbar(toolText: AppConstants.paymentMethods,color: Colors.transparent,),

            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 20.0,bottom: 10.0),
              child: CommonTextWidget(msg:AppConstants.debitCreditCard,font: dSansMedium,textSize: 18.0,color: black000000),
            ),
            const Expanded(child: ListOfCards()),
            Get.arguments[0]["call_from"]=="checkout"?TotalPricePay(btnText: AppConstants.pay,btnClick:(){

              Get.toNamed("/paymentDone");
            }): SizedBox()
          ]
        ),
      ),
    );
  }
}