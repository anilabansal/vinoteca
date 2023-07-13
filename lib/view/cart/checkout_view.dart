
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import '../../common/utils/common_strings.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_toolbar.dart';
import 'checkout_helper.dart';


class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonToolbar(toolText: AppConstants.checkout,color: Colors.transparent,),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20.0,bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CheckoutList(),
                        SizedBox(height: 20,),
                        OrderSummary(),
                        SizedBox(height: 20,),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20.0),
                    child: CommonButton(msg:AppConstants.checkout,callback: (){
                      Get.find<CartController>().checkOutButtonClick();
                    }),
                  )

                ],
              ),
            ))

          ],
        ),
      ),
    );
  }
}
