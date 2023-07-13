

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/controller/bottom_bar/bottom_bar_controller.dart';
import '../../controller/web_services/reward_webservices.dart';
import 'custom_bottom_bar.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RewardWebservices.lastLoginTimeApi();
    return Scaffold(
    //  bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Get.toNamed("/scanCodeView");
        },
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:orangeFFEFE5,
            shape: BoxShape.circle,
            border: Border.all(color:Colors.white,width: 2)
          ),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset("asset/images/bottom_bar/img_scanner.png"),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GetBuilder<BottomBarController>(builder: (controller){
        return controller.showWidget();
      }),
    );
  }
}
