

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vinoteca_app/controller/settings/setting_controller.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_text_widget.dart';

class SettingOptions extends StatelessWidget {

   SettingOptions({Key? key}) : super(key: key);

  final List<String> settingsOpt= ["Favourite","About us","Contact Us","Terms of services",
    "Store Location","Change Password"];

  @override
  Widget build(BuildContext context) {
    return  Column(
       children: settingsOpt.map((e) => commonOp(e,settingsOpt.indexOf(e))).toList(),
    );
  }


  Widget commonOp(title,index){
    return Column(
      children: [

        InkWell(
          onTap: (){
            Get.find<SettingController>().onClickSettingOption(index);
          },
          child: Padding(
              padding: const EdgeInsets.only(left:30.0,right: 30,top: 20.0,bottom: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextWidget(msg:title,font: dSansBold,textSize: 18.0,color: black000000),
                  const Icon(Icons.arrow_forward_ios_sharp)
                ],
              )
          ),
        ),
        settingsOpt.length-1 == index ?
        InkWell(
          onTap: (){
            Get.find<SettingController>().onClickLogout();
          },
          child: Container(
            //height: 50,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 10.0,bottom: 10.0),
            decoration: const BoxDecoration(
                color: greybgD7D7D7,
                borderRadius: BorderRadius.all(Radius.circular(7.0))
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("asset/images/settings/img_logout.svg"),
                const SizedBox(width: 10),
                CommonTextWidget(msg:"Logout",font: dSansBold,textSize: 18.0,color: orangeDC571F),
              ]
            )
          ),
        ):
        Container(
          height: 1,
          // color: settingsColo.elementAt(index),
          color: greyD8D8D8,
        )
      ],
    );
  }

}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



