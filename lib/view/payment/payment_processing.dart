





import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

class PaymentProcessing extends StatelessWidget {
  const PaymentProcessing({Key? key}) : super(key: key);

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

                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SvgPicture.asset("asset/images/payment/img_dummy_card.svg", fit: BoxFit.fill),
                            ),
                          ),
                          CircularProgress(width: 100,height: 100,)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CommonTextWidget(msg:"Payment in processing",textSize: 22.0,font: dSansBold,color: black000000,),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextWidget(msg:"Please do not press back or close the app......",textAlign:TextAlign.center,textSize: 16.0,font: dSansRegular,color: black525252,),
                    const SizedBox(
                      height: 50,
                    ),



                  ]
              ),
            )
        )
    );
  }
}
