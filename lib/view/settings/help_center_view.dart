

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/settings/contact_controller.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              children: [
                CommonToolbar(toolText: AppConstants.helpCenter),
                Expanded(
                  child: SingleChildScrollView(
                    child: GetBuilder<ContactController>(
                      builder: (controller) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(""),
                                CommonTextFieldWidget(title: AppConstants.name,msg: "Enter your name",font:dSansRegular,textSize: 16.0,textEditController: controller.name.value,),
                                const SizedBox(height: 10,),
                                CommonTextFieldWidget(title: AppConstants.email,msg: "Enter your Email ",font:dSansRegular,textSize: 16.0,textEditController:controller.email.value,),
                                const  SizedBox(height: 10,),
                                CommonTextFieldWidget(title: AppConstants.subject,msg: "Add Subject",font:dSansRegular,textSize: 16.0,textEditController:controller.subject.value),
                                const SizedBox(height: 10,),
                                CommonTextFieldWidget(title: "Add a ${AppConstants.message}",msg: "Add a message",font:dSansRegular,textSize: 16.0,textEditController:controller.message.value),
                                const SizedBox(height: 10,),
                                CommonButton(msg: AppConstants.submit,callback: (){
                                  controller.onClickSubmitHelpCenter();
                                }),
                                const SizedBox(height: 10,),
                                CommonTextButton(msg: AppConstants.cancel,callback: (){
                                  Get.back();
                                },)
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}
