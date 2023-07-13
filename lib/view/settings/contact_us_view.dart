



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/settings/contact_controller.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../../controller/auth/signup_controller.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  CommonToolbar(toolText: AppConstants.contactUs,),

                  Expanded(
                    child: Column(

                      children: [
                        const SizedBox(height: 30),
                        Expanded(child:  SvgPicture.asset("asset/images/settings/img_contact_us.svg"),),

                        //Todo : Bottom part of screen

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GetBuilder<ContactController>(
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  CommonTextFieldWidget(title: AppConstants.name,msg: "Enter your name",font:dSansRegular,textSize: 16.0,textEditController: controller.name.value),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonTextFieldWidget(title: AppConstants.email,msg: "Enter your Email ",font:dSansRegular,textSize: 16.0,textEditController:controller.email.value),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonTextFieldWidget(title: AppConstants.message,msg: "Your message",font:dSansRegular,textSize: 16.0,textEditController:controller.message.value),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonButton(msg: AppConstants.sendMessage,callback: (){
                                    controller.onClickSendMessage();
                                  }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonTextButton(msg: AppConstants.cancel,callback: (){
                                    Get.back();
                                  },)
                                ],
                              );
                            }
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
