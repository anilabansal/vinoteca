import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/settings/setting_controller.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GetBuilder<SettingController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextWidget(
                    msg: AppConstants.creditCardDebitCard.toUpperCase(),
                    textSize: 22.0,
                    font: georgiaBold,
                    color: black000000,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTextWidget(
                    msg: AppConstants.pleasefillinfo,
                    textSize: 16.0,
                    font: dSansRegular,
                    color: black525252,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset("asset/images/payment/img_dummy_card.svg"),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTextFieldWidget(
                    title: AppConstants.cardNumber,
                    msg: "Enter Card number",
                    font: dSansRegular,
                    textSize: 16.0,
                    inputType: TextInputType.number,
                    textEditController: controller.cardNo.value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTextFieldWidget(
                    title: AppConstants.cardHolderName,
                    msg: "Enter Card Holder Name",
                    font: dSansRegular,
                    textSize: 16.0,
                    textEditController: controller.cardHolder.value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                        onTap: () {

                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          decoration: const BoxDecoration(
                              border: Border(
                            bottom: BorderSide(width: 1.0, color: greyD8D8D8),
                          )),
                          child: const Text("",
                              style: TextStyle(color: black000045)),
                        ),
                      )),
                      // Expanded(child:  CommonDropDown(title: AppConstants.ExpDate,selected:"2022",list: ["2022","2023","2024"],hint: "Choose Exp",),),
                      const SizedBox(
                        width: 20,
                      ),
                      //Expanded(child:  CommonTextFieldWidget(title: AppConstants.Cvv,selected:"2022",list: ["2022","2023","2024"],hint: "Choose Exp",),),
                      Expanded(
                        child: CommonTextFieldWidget(
                          title: AppConstants.Cvv,
                          msg: "Enter Cvv",
                          font: dSansRegular,
                          textSize: 16.0,
                          inputType: TextInputType.number,
                          textEditController: controller.cardCvv.value,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonButton(
                    msg: AppConstants.save,
                    callback: () {
                      Get.find<SettingController>().addCardApi();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonTextWidget(
                          msg: AppConstants.skip,
                          textSize: 18.0,
                          font: dSansMedium,
                          color: black525252,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 13),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 13),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        )));
  }
}
