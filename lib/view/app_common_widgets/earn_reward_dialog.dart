import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';

import '../../common/utils/common_font.dart';

/// This class is for common progress indicator

class EarnRewardDialog {
  static AlertDialog? alert;

  static void showAlertDialog(BuildContext context,String points) {
    alert = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
            child: Container(
                decoration:
                    BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTextWidget(msg:"Congratulations!",font: dSansBold,textSize: 20.0,color: black000000),

                      Stack(
                        children: [
                          Container(
                            height: 100,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 70),
                            decoration:
                            BoxDecoration(border: Border.all(color: yellowEEB83E,width: 1),borderRadius: BorderRadius.circular(10.0)),
                          child: CommonTextWidget(msg:"$points Points Earn",font: dSansMedium,textSize: 18.0,color: yellowEEB83E),
                          ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Lottie.asset(
                               "asset/images/progress/app_earn_reward.json",
                               width: 120,
                               height: 120,
                               fit: BoxFit.fill,
                               repeat: true,
                             )
                           ],
                         )
                        ],
                      )
                    ],
                  ),
                ))));
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => true, child: alert!);
      },
    );
  }
}
