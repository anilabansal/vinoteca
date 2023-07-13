

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/database/app_database.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

class OtpVerificationDone extends StatelessWidget {
  const OtpVerificationDone({Key? key}) : super(key: key);

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
                 CommonTextWidget(msg:AppConstants.verifyDone,textSize: 22.0,font: dSansBold,color: black000000,),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextWidget(msg:AppConstants.verifyEmail1+AppConstants.verifyEmail2,textAlign:TextAlign.center,textSize: 16.0,font: dSansRegular,color: black525252,),
                  const SizedBox(
                    height: 50,
                  ),

                  CommonButton(msg: AppConstants.continueTo,callback: (){
                    Get.offAllNamed("/resetPass");
                  }),

                  const SizedBox(
                    height: 30,
                  ),

                ],
              ),
            )
        )
    );
  }
}
